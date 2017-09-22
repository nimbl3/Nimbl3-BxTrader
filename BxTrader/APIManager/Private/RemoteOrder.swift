//
//  RemoteOrder.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import Alamofire
import RxSwift
import SwiftyJSON
class RemoteOrder: NSObject {
    func createOrder(pairingID: Int, type: String, amount: Double, rate: Double) -> Observable<CreateOrderResponse> {
        return Observable<CreateOrderResponse>.create() { [weak self] observer in
            guard let strongSelf = self else { return Disposables.create() }
            let params: [String : Any] = [
                "pairing":pairingID,
                "type":type,
                "amount":amount,
                "rate":rate]
            
            Alamofire.request(strongSelf.createOrderURL, method: .post, parameters: params).responseJSON() { response in
                
                if (response.result.isFailure) {
                    observer.onError(APIError(errorDescription: (response.result.error?.localizedDescription)!))
                    observer.onCompleted()
                    return;
                }
                let json = JSON(response.result.value!)
                if (json["success"].boolValue == false) {
                    observer.onError(APIError(errorDescription: json["error"].stringValue))
                    observer.onCompleted()
                } else {
                    if let createOrderResponse = CreateOrderResponse(JSON: (response.result.value as? JSONDictionary)!) {
                        observer.onNext(createOrderResponse)
                        observer.onCompleted()
                    }
                }
                
                
            }
            
            return Disposables.create()
        }
    }
    func cancelOrder() {
        
    }
    func getOrder() {
        
    }
    
    
    
}

extension RemoteOrder {
    fileprivate var createOrderURL: String { return "https://bx.in.th/api/order/" }
    fileprivate var cancelOrderURL: String { return "https://bx.in.th/api/cancel/" }
    fileprivate var getOrderURL: String { return "https://bx.in.th/api/getorders/" }
}

