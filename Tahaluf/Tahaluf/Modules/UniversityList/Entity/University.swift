//
//  University.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

class University: Decodable {
    var name: String
    var province: String?
    var countryCode: String?
    var country: String?
    var websites: [String]?
}
