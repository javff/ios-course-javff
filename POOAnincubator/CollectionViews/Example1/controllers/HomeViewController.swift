//
//  HomeViewController.swift
//  POOAnincubator
//
//  Created by Juan  Vasquez on 7/11/19.
//  Copyright © 2019 com.javffCompany. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    //MARK: - UI Vars
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var footerLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    
    //MARK: - Vars
    let reuseIdentifier = "OfferCell"
    var offers:[Offer] = [
        Offer.init(name: "confetti", image: UIImage(named:"confetti")),
        Offer.init(name: "clipBoard", image: UIImage(named:"clipboard")),
        Offer.init(name: "presupuesto", image: UIImage(named:"budget"))
    ]
    
    //MARK: - builder
    
    class func createController() -> HomeViewController{
        
        let storyboard = UIStoryboard.init(name: "HomeView", bundle: nil)
        let controller = storyboard.instantiateInitialViewController()! as! HomeViewController
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCell()
        collectionView.dataSource = self
        collectionView.delegate = self
        

    }
    
    //MARK: - Setups
    override func setupView() {
        super.setupView()
        collectionView.backgroundColor = .white
    }
    
    private func setupCell(){
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}

//MARK: - CollectionView Implementations

extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! OfferCell
        
        let offer = offers[indexPath.item]
        
        cell.offerTitleLabel.text = offer.name
        cell.imageView.image = offer.image
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 200, height: collectionView.bounds.height - 20)
    }
    
    
    
}
