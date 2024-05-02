//
//  BaseViewController.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import UIKit
import ProgressHUD

class BaseViewController: UIViewController, BaseVCDisplayable {
    func reloadData() {
        
    }
    
    func updateEmptyState(isEmpty: Bool) {
        
    }
    
    func updateHUDState(showProgress: Bool) {
        DispatchQueue.dispatchMainIfNeeded {
            if showProgress {
                ProgressHUD.animate()
                self.view.isUserInteractionEnabled = false
            } else {
                ProgressHUD.dismiss()
                self.view.isUserInteractionEnabled = true
            }
        }
    }

    func showAlert(title: String = "",
                   message: String,
                   destructionTitle: String = "Dismiss",
                   actionTitle: String? = nil,
                   actionCompletion: EmptyClosure? = nil) {
        DispatchQueue.dispatchMainIfNeeded {
            let alert = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: destructionTitle, style: .destructive) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            
            if let actionTitle = actionTitle {
                let dAction = UIAlertAction(title: actionTitle, style: .default) { _ in
                    actionCompletion?()
                    alert.dismiss(animated: true, completion: nil)
                }
                alert.addAction(dAction)
            }
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
