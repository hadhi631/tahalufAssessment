//
//  AppRouter.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import UIKit

final class AppRouter {
    var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        // Set the start module
        window.rootViewController = UINavigationController(rootViewController: UniversityListBuilder.create())
        
        window.makeKeyAndVisible()
    }
}
