//
//  APIManager.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit

class APIManager: NSObject {
    
    private var nounce: Int = 0
    
    static let sharedInstance = APIManager()
    
    var publicAPI = publicBxAPI()
    var privateAPI = privateBxAPI()
    
    struct publicBxAPI {
        var remoteTicker = RemoteTicker()
        var remoteCurrencyPairing = RemoteCurrencyPairing()
        var remoteOrderBooking = RemoteOrderBooking()
        var remoteRecentTrade = RemoteRecentTrade()
    }
    
    struct privateBxAPI {
        var remoteOrder = RemoteOrder()
        var remoteTransactionHistory = RemoteTransactionHistory()
        var remoteWallet = RemoteWallet()
    }
    
    func plusNounce() {
        nounce += 1
    }
    
    func getNounce() -> Int {
        return nounce
    }
}
