//
//  UniversityDetailsBuilder.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import UIKit

final class UniversityDetailsBuilder {
    static func create(_ window: UIWindow, entity: University) -> UIViewController {
        let vc = UniversityDetailsVC(nibName: UniversityDetailsVC.identifier, bundle: nil)
        
        let presenter = UniversityDetailsPresenter(with: entity)
        vc.presenter = presenter
        presenter.view = vc
                
        let router = UniversityDetailsRouter(vc: vc, window: window)
        presenter.router = router
        
        return vc
    }
}
