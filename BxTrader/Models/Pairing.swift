//
//  Pairing.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/21/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit
import ObjectMapper

class Pairing: Mappable  {
    
    var pairingID: Int = 0
    var primaryCurrency: String = ""
    var secondaryCurrency: String = ""
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        pairingID <- map["pairing_id"]
        primaryCurrency <- map["primary_currency"]
        secondaryCurrency <- map["secondary_currency"]
    }
}
