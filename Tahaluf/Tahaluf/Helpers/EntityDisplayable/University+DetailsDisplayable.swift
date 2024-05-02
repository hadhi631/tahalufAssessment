//
//  University+DetailsDisplayable.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

protocol UniversityDetailsDisplayable: UniversityTableCellDisplayable {
    var universityCountry: String? { get }
    var universityCountryCode: String? { get }
}

extension University: UniversityDetailsDisplayable {
    var universityCountry: String? {
        return country
    }
    
    var universityCountryCode: String? {
        return countryCode
    }
}
