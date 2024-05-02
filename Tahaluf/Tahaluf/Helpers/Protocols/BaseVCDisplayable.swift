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
}
