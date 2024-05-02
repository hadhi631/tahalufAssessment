//
//  University.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation
import RealmSwift

class University: Object, Decodable {
    @objc dynamic var name: String?
    @objc dynamic var province: String?
    @objc dynamic var countryCode: String?
    @objc dynamic var country: String?
    
    private enum CodingKeys : String, CodingKey {
        case name
        case province = "state-province"
        case countryCode = "alpha_two_code"
        case country
    }
}
