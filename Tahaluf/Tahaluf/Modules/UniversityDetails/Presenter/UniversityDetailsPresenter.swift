//
//  UniversityDetailsPresenter.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

protocol UniversityDetailsPresenterAdaptable: BasePresenterAdaptable {
    var title: String { get }
    var dataSource: UniversityDetailsDisplayable { get }
    
    var view: UniversityDetailsVCDisplayable! { get set }
    var router: UniversityDetailsRouterAdaptable! { get set }
    
    init(with item: University)
    
    func didSelectRefresh()
}

class UniversityDetailsPresenter: UniversityDetailsPresenterAdaptable {
    
    weak var view: UniversityDetailsVCDisplayable!
    var router: UniversityDetailsRouterAdaptable!
    
    private var item: University
    
    var title: String {
        return "Details"
    }
    
    var dataSource: UniversityDetailsDisplayable {
        return item
    }
    
    required init(with item: University) {
        self.item = item
    }
    
    func viewDidLoad() {
        view.reloadData()
    }
    
    func viewWillAppear() {
        
    }
    
    func didSelectRefresh() {
        NotificationCenter.default.post(name: .reloadUniversityListData, object: nil)
        
        router.dismiss()
    }
}
