//
//  UniversityListBuilder.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import UIKit

final class UniversityListBuilder {
    static func create() -> UIViewController {
        let vc = UniversityListVC(nibName: UniversityListVC.identifier, bundle: nil)
        
        return vc
    }
}
