//
//  APIError.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import Foundation

enum APIError: LocalizedError {
    case requestFailure
    case parsingFailure
    case customError
    
    var errorDescription: String? {
        switch self {
        case .requestFailure: return "Request Failure"
        case .customError: return "CustomError"
        case .parsingFailure: return "Parsing Error"
        }
    }
}
