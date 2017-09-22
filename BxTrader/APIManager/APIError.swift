//
//  APIError.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import Foundation

struct APIError: Error {
    var customError: String
    init(errorDescription: String) {
        customError = errorDescription
    }
}


