//
//  UniversityDetailsRouter.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import UIKit

protocol UniversityDetailsRouterAdaptable: BaseRouterAdaptable {
    func dismiss()
}

class UniversityDetailsRouter: UniversityDetailsRouterAdaptable {
    private weak var vc: UIViewController!
    private weak var window: UIWindow!
    
    required init(vc: UIViewController, window: UIWindow)  {
        self.vc = vc
        self.window = window
    }
    
    func dismiss() {
        vc.navigationController?.popViewController(animated: true)
    }
}
