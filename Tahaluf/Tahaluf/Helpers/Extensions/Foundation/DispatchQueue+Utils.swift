//
//  DispatchQueue+Utils.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

extension DispatchQueue {
    class func dispatchMainIfNeeded(_ closure: @escaping EmptyClosure) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async(execute: closure)
            return
        }

        closure()
    }
}
