//
//  BaseVCDisplayable.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

protocol BaseVCDisplayable: AnyObject {
    func reloadData()
    func updateEmptyState(isEmpty: Bool)
    func updateHUDState(showProgress: Bool)
    func showAlert(title: String,
                   message: String,
                   destructionTitle: String,
                   actionTitle: String?,
                   actionCompletion: EmptyClosure?)
}

extension BaseVCDisplayable {
    func showAlert(title: String = "",
                   message: String,
                   destructionTitle: String = "Dismiss",
                   actionTitle: String? = nil,
                   actionCompletion: EmptyClosure? = nil) {
        
    }
}
