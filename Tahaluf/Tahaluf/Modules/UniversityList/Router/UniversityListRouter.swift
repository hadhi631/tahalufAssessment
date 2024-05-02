//
//  UniversityListRouter.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import UIKit

protocol UniversityListRouterAdaptable: BaseRouterAdaptable {
    func routeToUniversityDetails(_ entity: University)
}

class UniversityListRouter: UniversityListRouterAdaptable {
    private weak var vc: UIViewController!
    private weak var window: UIWindow!
    
    required init(vc: UIViewController, window: UIWindow)  {
        self.vc = vc
        self.window = window
    }
    
    func routeToUniversityDetails(_ entity: University) {
        let nextVC = UniversityDetailsBuilder.create(window, entity: entity)
        vc.navigationController?.show(nextVC, sender: nil)
    }
}
