//
//  RemoteOrderBooking.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class RemoteOrderBooking: NSObject {
    func getOrderBooking(with pairingID: Int) -> Observable<[OrderBook]> {
        return Observable.create() { [weak self] observer in
            Alamofire.request((self?.orderBookingURL(with: pairingID))!).responseJSON() { response in
                if (response.result.isFailure) {
                    return
                }
                guard let responseValue = response.result.value as? JSON else { return }
                
                
                for (key, value) in responseValue {
                    if (key == "bids") {
                        if let bidsJSON = value as? [Array<String>] {
                            var bids: [OrderBookingPair] = []
                            for bidJSON in bidsJSON {
                                
                                let primary = NumberFormatter()
                                    .number(from: bidJSON.first!)?
                                    .doubleValue
                                    .rounded(toPlaces: 8)
                                let secondary = NumberFormatter()
                                    .number(from: bidJSON.last!)?
                                    .doubleValue
                                    .rounded(toPlaces: 8)
                                
                                let bid = OrderBookingPair(primaryCurrency: primary!,
                                                           secondaryCurrency: secondary!)
                                bids.append(bid)
                            }
                            print(bids)
                        }
                    } else {
                        if let asksJSON = value as? [Array<String>] {
                            var asks: [OrderBookingPair] = []
                            for askJSON in asksJSON {
                                
                                let primary = NumberFormatter()
                                    .number(from: askJSON.first!)?
                                    .doubleValue
                                    .rounded(toPlaces: 8)
                                let secondary = NumberFormatter()
                                    .number(from: askJSON.last!)?
                                    .doubleValue
                                    .rounded(toPlaces: 8)
                                
                                let ask = OrderBookingPair(primaryCurrency: primary!,
                                                           secondaryCurrency: secondary!)
                                asks.append(ask)
                            }
                            print(asks)
                        }
                    }
                }
            }
            return Disposables.create()
        }
    }
}
extension RemoteOrderBooking {
    fileprivate func orderBookingURL(with pairing: Int) -> String {
        return "https://bx.in.th/api/orderbook/?pairing=\(pairing)"
    }
}
