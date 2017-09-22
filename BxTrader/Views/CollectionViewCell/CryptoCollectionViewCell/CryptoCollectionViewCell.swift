//
//  CryptoCollectionViewCell.swift
//  BxTrader
//
//  Created by Issarapong Poesua on 9/22/2560 BE.
//  Copyright © 2560 Issarapong Poesua. All rights reserved.
//

import UIKit

class CryptoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var secondaryCurrencyLabel: UILabel!
    var secondary: String {
        set { secondaryCurrencyLabel.text = newValue }
        get { return secondaryCurrencyLabel.text ?? "" }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configCircle()
    }
    
    func config(with ViewModel: MakeOrder.RequestTicker.ViewModel.TickerList) {
        self.secondary = ViewModel.secondary
    }
    func configCircle() {
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.frame.height / CGFloat(2)
        circleView.layer.borderWidth = 1
        circleView.layer.borderColor = UIColor(red:0.25, green:0.6, blue:1, alpha:1).cgColor

    }
}
