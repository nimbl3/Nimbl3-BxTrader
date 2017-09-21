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
    
    var change: Double = 0
    var lastPrice: Double = 0
    var orderBook: [OrderBook] = []
    var pairingID: Int = 0
    var primaryCurrency: String = ""
    var secondaryCurrency: String = ""
    var volume24Hours: Double = 0

    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
    }
    
}
