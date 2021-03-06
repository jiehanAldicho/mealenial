//
//  AccountViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 16/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    //Navbar Variables
    var fakeNavBar: UIView!
    
    //Collection View Variables
    var overviewCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fakeNavBar = addCustomNavbar("Settings")
        
        self.view.addSubview(fakeNavBar)
        setupCollectionView()
        self.view.addSubview(overviewCollectionView)
        setupCollectionViewConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
}

//MARK: Extension

//Collection View Extension

extension AccountViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let inputCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AccountCell", for: indexPath) as! AccountCollectionViewCell
        inputCell.delegate = self
        return inputCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 342, height: 537)
    }
}

//Setup Extension
extension AccountViewController: MealScheduleDelegate {
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        overviewCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        overviewCollectionView.dataSource = self
        overviewCollectionView.delegate = self
        overviewCollectionView.backgroundColor = Colors.backgroundColor
        overviewCollectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: "AccountCell")
    }
    
    func setupCollectionViewConstraint() {
        overviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        overviewCollectionView.topAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: 0).isActive = true
        overviewCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        //        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        overviewCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        overviewCollectionView.layer.zPosition = -1
    }
    
    func navigateToMealSchedule() {
        let mealScheduleVC = ScheduleViewController()
        self.navigationController?.pushViewController(mealScheduleVC, animated: true)
    }
}
