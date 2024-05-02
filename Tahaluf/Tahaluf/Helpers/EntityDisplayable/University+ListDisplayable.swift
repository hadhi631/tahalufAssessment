//
//  University+ListDisplayable.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

extension University: UniversityTableCellDisplayable {
    var universityName: String {
        return name
    }
    
    var universityState: String? {
        return province ?? "-- No State Info --"
    }
}
