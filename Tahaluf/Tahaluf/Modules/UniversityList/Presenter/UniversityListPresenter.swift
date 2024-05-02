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
}

class UniversityListPresenter: UniversityListPresenterAdaptable {
    
    weak var view: UniversityListVCDisplayable!
    var interactor: UniversityListInteractorAdaptable!
    
    private var items: [University] = []
    
    var dataSource: TableViewDataSourceAdaptable {
        return self
    }
    
    var title: String {
        return "Universities"
    }
    
    func viewDidLoad() {
        view.updateHUDState(showProgress: true)
        interactor.fetchUniversities()
    }
    
    func viewWillAppear() {
        
    }
}

extension UniversityListPresenter: TableViewDataSourceAdaptable {
    func numberOfRowsIn(section: Int) -> Int {
        return items.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CellDisplayable? {
        return items[indexPath.row]
    }
}

extension UniversityListPresenter: UniversityListInteractorOutputAdaptable {
    func didFinishFetchingUniversities(_ data: [University]?, error: TFError?) {
        view.updateHUDState(showProgress: false)
        
        if let error {
            view.showAlert(title: error.errorTitle,
                           message: error.errorMessage,
                           destructionTitle: "OK",
                           actionTitle: nil,
                           actionCompletion: nil)
            return
        }
        
        guard let data else {
            return
        }
        
        self.items = data
        if self.items.isEmpty {
            view.updateEmptyState(isEmpty: true)
        } else {
            view.updateEmptyState(isEmpty: false)
            view.reloadData()
        }
    }
}
