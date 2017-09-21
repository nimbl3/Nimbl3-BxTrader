//
//  Ticker.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import ObjectMapper

class Ticker: Mappable {
    
    var pairingID: Int = 0
    var primaryCurrency: String = ""
    var secondaryCurrency: String = ""
    var change: Double = 0
    var lastPrice: Double = 0
    var volume24Hours: Double = 0
    var orderBook: [OrderBook] = []

    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        pairingID <- map["pairing_id"]
        primaryCurrency <- map["primary_currency"]
        secondaryCurrency <- map["secondary_currency"]
        change <- map["change"]
        lastPrice <- map["last_price"]
        volume24Hours <- map["volume_24hours"]
        orderBook <- map["orderbook"]
    }
    
}
