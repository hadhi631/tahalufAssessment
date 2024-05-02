//
//  UniversityListPresenter.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

protocol UniversityListPresenterAdaptable: BasePresenterAdaptable {
    var dataSource: TableViewDataSourceAdaptable { get }
    var title: String { get }
    
    var view: UniversityListVCDisplayable! { get set }
    var interactor: UniversityListInteractorAdaptable! { get set }
    var router: UniversityListRouterAdaptable! { get set }
}

class UniversityListPresenter: UniversityListPresenterAdaptable {
    
    weak var view: UniversityListVCDisplayable!
    var interactor: UniversityListInteractorAdaptable!
    var router: UniversityListRouterAdaptable!
    
    private var items: [University] = []
    private var isDirty: Bool = false
    
    var dataSource: TableViewDataSourceAdaptable {
        return self
    }
    
    var title: String {
        return "Universities"
    }
    
    func viewDidLoad() {
        view.updateHUDState(showProgress: true)
        interactor.fetchUniversities()
        
        NotificationCenter.default.addObserver(forName: .reloadUniversityListData, object: nil, queue: nil) { notif in
            self.isDirty = true
        }
    }
    
    func viewWillAppear() {
        if isDirty {
            isDirty = false
            
            view.updateHUDState(showProgress: true)
            interactor.fetchUniversities()
        }
    }
}

extension UniversityListPresenter: TableViewDataSourceAdaptable {
    func numberOfRowsIn(section: Int) -> Int {
        return items.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CellDisplayable? {
        return items[indexPath.row]
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        router.routeToUniversityDetails(items[indexPath.row])
    }
}

extension UniversityListPresenter: UniversityListInteractorOutputAdaptable {
    func didFinishFetchingUniversities(_ data: [University]?, error: TFError?) {
        view.updateHUDState(showProgress: false)
        
        // If got data, show it
        if let data {
            self.items = data
            if self.items.isEmpty {
                view.updateEmptyState(isEmpty: true)
            } else {
                view.updateEmptyState(isEmpty: false)
                view.reloadData()
            }
        }
        
        // If got an error, even if the data shows from DB, show the error too
        if let error {
            view.showAlert(title: error.errorTitle,
                           message: error.errorMessage,
                           destructionTitle: "OK",
                           actionTitle: nil,
                           actionCompletion: nil)
        }
    }
}
