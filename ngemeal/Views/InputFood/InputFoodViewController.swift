//
//  InputFoodViewController.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 18/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit
import Charts

class InputFoodViewController: UIViewController {
    
    // Image Variables
    var imageVar: UIImage = UIImage()
    
    //Multi Slider Data Variables
    var vegVal = 50
    var protVal = 33
    var stapVal = 17
    
    //Collection View Variables
    var overviewCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TabBar Setup
        self.tabBarController?.tabBar.isHidden = true
        
        //Navigation Bar Setup
        self.setCustomNavbar()
        
        //Collection View Setup
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        overviewCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        overviewCollectionView.dataSource = self
        overviewCollectionView.delegate = self
        overviewCollectionView.backgroundColor = Colors.backgroundColor
        overviewCollectionView.register(InputFoodCell.self, forCellWithReuseIdentifier: "inputFoodCell")
        
        self.view.addSubview(overviewCollectionView)
        setupCollectionViewConstraint()
    }
    
    func setupCollectionViewConstraint() {
        overviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        overviewCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        overviewCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        overviewCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        overviewCollectionView.layer.zPosition = -1
    }
    
}

//MARK: Extension

//Collection View extension
extension InputFoodViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let inputCell = collectionView.dequeueReusableCell(withReuseIdentifier: "inputFoodCell", for: indexPath) as! InputFoodCell
        
        inputCell.imageVarCell = imageVar
        inputCell.vegVal = vegVal
        inputCell.protVal = protVal
        inputCell.stapVal = stapVal
        
        return inputCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 342, height: 805)
    }
    
}
