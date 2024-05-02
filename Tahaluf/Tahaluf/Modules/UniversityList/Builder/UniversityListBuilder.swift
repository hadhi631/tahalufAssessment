//
//  UniversityListBuilder.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import UIKit

final class UniversityListBuilder {
    static func create(_ window: UIWindow) -> UIViewController {
        let vc = UniversityListVC(nibName: UniversityListVC.identifier, bundle: nil)
        
        let presenter = UniversityListPresenter()
        vc.presenter = presenter
        presenter.view = vc
        
        let interactor = UniversityListInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        let router = UniversityListRouter(vc: vc, window: window)
        presenter.router = router
        
        return vc
    }
}
