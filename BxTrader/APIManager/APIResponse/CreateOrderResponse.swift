//
//  CreateOrderResponse.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/22/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import ObjectMapper

class CreateOrderResponse: Mappable {
    
    var success: Bool = false
    var orderID: Int = 0
    var errorMessage: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        orderID <- map["order_id"]
        errorMessage <- map["error"]
    }
    
}
