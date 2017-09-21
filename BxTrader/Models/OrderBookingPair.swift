//
//  OrderBookingPair.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/22/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit

struct OrderBookingPair {
    var primaryCurrency: Double
    var secondaryCurrency: Double
    
    init(primaryCurrency: Double, secondaryCurrency: Double) {
        self.primaryCurrency = primaryCurrency
        self.secondaryCurrency = secondaryCurrency
    }
}

