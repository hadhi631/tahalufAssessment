//
//  TFError.swift
//  Tahaluf
//
//  Created by Hadhi on 02/05/2024.
//

import Foundation

protocol TFError: Error {
    var errorTitle: String { get }
    var errorMessage: String { get }
    var errorCode: String? { get }
}

enum GeneralError: TFError {
    case generalError
    
    var errorTitle: String {
        return "Error"
    }
    
    var errorMessage: String {
        return "Unknown error. Please try later"
    }
    
    var errorCode: String? {
        return nil
    }
}

enum APIError: TFError {
    case networkError
    case badUrl
    case parsingError
    case emptyData
    case serverFailure
    
    var errorTitle: String {
        return "Error"
    }
    
    var errorMessage: String {
        switch self {
        case .networkError:
            return "Network connection failed. Please try later"
        case .badUrl:
            return "Bad URL. Please try later"
        case .parsingError:
            return "Received invalid data. Please try later"
        case .emptyData:
            return "Received no data. Please try later"
        case .serverFailure:
            return "Invalid error code. Please try later"
        }
    }
    
    var errorCode: String? {
        return nil
    }
}

struct CustomError: TFError {
    let title: String
    let message: String
    
    var errorTitle: String {
        return title
    }
    
    var errorMessage: String {
        return message
    }
    
    var errorCode: String? {
        return nil
    }
}
