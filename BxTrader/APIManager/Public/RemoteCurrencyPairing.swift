//
//  RemoteCurrencyPairing.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import ObjectMapper

class RemoteCurrencyPairing {
    func getParing() -> Observable<[Pairing]> {
        return Observable.create() { observer in
            
            Alamofire.request(self.tickerURL).responseJSON() { response in
                if (response.result.isFailure) { // Request Failure
                    observer.onError(response.result.error!)
                    observer.onCompleted()
                }
                if let responseValue = response.result.value as? JSON {
                    var pairings:[Pairing] = []
                    for (_, value) in responseValue {
                        if let pairingResponse = value as? JSON {
                            if let pairingObject = Pairing(JSON: pairingResponse) {
                                pairings.append(pairingObject)
                            }
                        } else {
                            observer.onError(APIError.parsingFailure)
                            observer.onCompleted()
                        }
                    }
                    observer.onNext(pairings)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}

extension RemoteCurrencyPairing {
    fileprivate var tickerURL: String { return "https://bx.in.th/api/" }
}

