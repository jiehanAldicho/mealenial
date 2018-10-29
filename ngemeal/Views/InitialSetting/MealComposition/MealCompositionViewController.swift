//
//  MealCompositionViewController.swift
//  ngemeal
//
//  Created by Yuvens Putra Barata on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//
import UIKit
class MealCompositionViewController: UIViewController {
    
    //Navbar Variables
    var fakeNavBar: UIView!
    
    //Collection View Variables
    var overviewCollectionView : UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupNavBar()
        setupCollectionView()
        self.view.addSubview(overviewCollectionView)
        self.view.addSubview(fakeNavBar)
        setupCollectionViewConstraint()
    }
}
//MARK: Extension
//Collection View Extension
extension MealCompositionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let inputCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealComposeCell", for: indexPath) as! MealCompositionCollectionViewCell
        inputCell.delegate = self
        return inputCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 342, height: 650)
    }
}
//Setup Function Extension
extension MealCompositionViewController {
    func setupTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setupNavBar() {
        fakeNavBar = addCustomNavbar("Personalization")
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        overviewCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        overviewCollectionView.dataSource = self
        overviewCollectionView.delegate = self
        overviewCollectionView.backgroundColor = Colors.backgroundColor
        overviewCollectionView.register(MealCompositionCollectionViewCell.self, forCellWithReuseIdentifier: "mealComposeCell")
    }
    
    func setupCollectionViewConstraint() {
        overviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        overviewCollectionView.topAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: 0).isActive = true
        overviewCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        //        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        overviewCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        overviewCollectionView.layer.zPosition = -1
    }
}
extension MealCompositionViewController: MealCompositionCollectionViewCellDelegate, UINavigationControllerDelegate {
    func pushNext() {
        
        //PUSH TO NEXT VIEW CODE
        let mainTabBarCon = MainTabBarController() as UIViewController
        self.navigationController?.pushViewController(mainTabBarCon, animated: true)
        
    }
}
