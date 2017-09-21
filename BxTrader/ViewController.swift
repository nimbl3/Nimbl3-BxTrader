//
//  ViewController.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager
            .sharedInstance
            .publicAPI
            .remoteOrderBooking
            .getOrderBooking(with: 1)
            .subscribe().addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}

