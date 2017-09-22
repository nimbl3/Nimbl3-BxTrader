//
//  APIManager.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import CryptoSwift

class APIManager: NSObject {
    
    static let sharedInstance = APIManager()
    
    var apiKey: String {
        set { UserDefaults.standard.set(newValue, forKey: "apiKey") }
        get { return UserDefaults.standard.object(forKey: "apiKey") as? String ?? "" }
    }
    var apiSecret: String {
        set { UserDefaults.standard.set(newValue, forKey: "apiSecret") }
        get { return UserDefaults.standard.object(forKey: "apiSecret") as? String ?? "" }
    }
    var nounce: String {
        return "\(CUnsignedLongLong(NSDate().timeIntervalSince1970))"
    }
    var signature: String {
        let beforeSignature = apiSecret + nounce + apiSecret
        return beforeSignature.sha256()
    }
    
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

}
