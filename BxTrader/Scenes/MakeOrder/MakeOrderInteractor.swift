//
//  MakeOrderInteractor.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/22/2560 BE.
//  Copyright (c) 2560 Issarapong Poesua. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MakeOrderBusinessLogic {
  func fetchTicker(request: MakeOrder.RequestTicker.Request) 
}

protocol MakeOrderDataStore {
  //var name: String { get set }
}

class MakeOrderInteractor: MakeOrderBusinessLogic, MakeOrderDataStore {
  var presenter: MakeOrderPresentationLogic?
  var worker: MakeOrderWorker?
  // MARK: Do something
  
  func fetchTicker(request: MakeOrder.RequestTicker.Request) {
    worker = MakeOrderWorker()
    worker?.fetchTickers() { tickers in
        let response = MakeOrder.RequestTicker.Response(tickersList: tickers)
        self.presenter?.presentSomething(response: response)
    }

  }
}
