//
//  RemoteTicker.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift

class RemoteTicker: NSObject {
    func getTickers() -> Observable<[Ticker]> {
        return Observable.create() { [weak self] observer in
            Alamofire.request((self?.getTickerURL)!).responseJSON() { response in
                if (response.result.isFailure) {
                    return;
                }
                guard let responseValue = response.result.value as? [String:Any] else { return }
                var tickers: [Ticker] = []
                for (_, value) in responseValue {
                    if let tickerResponse = value as? [String:Any] {
                        if let ticker = Ticker(JSON: tickerResponse) {
                            tickers.append(ticker)
                        }
                    }
                }
                observer.onNext(tickers)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
}
extension RemoteTicker {
    fileprivate var getTickerURL: String { return "https://bx.in.th/api/" }
}
