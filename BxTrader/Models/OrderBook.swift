//
//  OrderBook.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit

struct OrderBook {
    var asks: [OrderBookingPair]
    var bids: [OrderBookingPair]
    init(asks: [OrderBookingPair], bids: [OrderBookingPair]) {
        self.asks = asks
        self.bids = bids
    }
}
