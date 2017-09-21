//
//  OrderBook.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import ObjectMapper

class OrderBook: Mappable {
    
    var highBid: Double = 0
    var total: Int = 0
    var volume: Double = 0
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        highBid <- map["highbid"]
        total <- map["total"]
        volume <- map["volume"]
    }
    
}
