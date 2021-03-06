//
//  MakeOrderViewController.swift
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

protocol MakeOrderDisplayLogic: class {
    func displaySomething(viewModel: MakeOrder.RequestTicker.ViewModel)
}

class MakeOrderViewController: UIViewController, MakeOrderDisplayLogic {

    var displayCrypto: [MakeOrder.RequestTicker.ViewModel.TickerList] = []
    
    var interactor: MakeOrderBusinessLogic?
    var router: (NSObjectProtocol & MakeOrderRoutingLogic & MakeOrderDataPassing)?
    
    // MARK: Object lifecycle
    
    @IBOutlet weak var cryptoListCollectionView: UICollectionView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = MakeOrderInteractor()
        let presenter = MakeOrderPresenter()
        let router = MakeOrderRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    fileprivate func setupCollectionView() {
        cryptoListCollectionView.register(UINib.init(nibName: "CryptoCollectionViewCell",
                                                     bundle: nil),
                                          forCellWithReuseIdentifier: "CryptoCollectionViewCell")
        cryptoListCollectionView.bounces = true
        
        guard let flowLayout = cryptoListCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return;
        }
        
        let height = cryptoListCollectionView.frame.height * 0.9
        
        
        flowLayout.itemSize = CGSize(width: height, height: height)
        
        flowLayout.minimumLineSpacing = 20.0
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.scrollDirection = .horizontal
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        loadTickers()
    }
    
    // MARK: Do something
    
    func loadTickers() {
        let request = MakeOrder.RequestTicker.Request()
        interactor?.fetchTicker(request: request)
    }
    
    func displaySomething(viewModel: MakeOrder.RequestTicker.ViewModel) {
        //nameTextField.text = viewModel.name
        displayCrypto = viewModel.displayTickers
        cryptoListCollectionView.reloadData()
    }

}

extension MakeOrderViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return displayCrypto.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CryptoCollectionViewCell",
                                                      for: indexPath) as! CryptoCollectionViewCell
        cell.config(with: displayCrypto[indexPath.item])
        return cell
    }
}
