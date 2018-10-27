//
//  FoodDetailViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    var img = UIImage() //Sended from food journal meal cell ???
    
    var detailCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCustomNavbar()
        
        //Collection View Setup
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        
        detailCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        detailCollectionView.dataSource = self
        detailCollectionView.delegate = self
        detailCollectionView.backgroundColor = Colors.backgroundColor
        detailCollectionView.register(FoodDetailCell.self, forCellWithReuseIdentifier: "foodDetail")
        
        view.addSubview(detailCollectionView)
    }
}

extension FoodDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let foodCell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodDetail", for: indexPath) as! FoodDetailCell
//        foodCell.receivedImg = UIImage(named: "Makanan")!
        return foodCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 342, height: 550)
    }
}
