//
//  FoodJournalViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class FoodJournalViewController: UIViewController {
    
    var fakeNavBar: UIView!
    var weekPicker: WeekPickerView!
    var foodJournalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        fakeNavBar = addCustomNavbar("Food Journal")
        weekPicker = WeekPickerView()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        
        foodJournalCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        foodJournalCollectionView.dataSource = self
        foodJournalCollectionView.delegate = self
        foodJournalCollectionView.backgroundColor = .white
        foodJournalCollectionView.register(FoodJournalDateCell.self, forCellWithReuseIdentifier: "dateCell")
        foodJournalCollectionView.backgroundColor = .clear
        
        view.addSubview(weekPicker)
        view.addSubview(foodJournalCollectionView)
        
        
        setupWeekPickerConstraints()
        setupCollectionViewConstraint()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func setupWeekPickerConstraints()  {
        weekPicker.translatesAutoresizingMaskIntoConstraints = false
        weekPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weekPicker.topAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: 20).isActive = true
        weekPicker.widthAnchor.constraint(equalToConstant: 343).isActive = true
        weekPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCollectionViewConstraint() {
        foodJournalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        foodJournalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        foodJournalCollectionView.topAnchor.constraint(equalTo: weekPicker.bottomAnchor, constant: 15).isActive = true
        foodJournalCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//        foodJournalCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        foodJournalCollectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
    }
    
    func navigateToDetail() {
//        let transition: CATransition = CATransition()
//        transition.duration = 0.4
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        transition.type = CATransitionType.fade
//        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        //Pass data to detailVC ya
        let detailVC = FoodDetailViewController()
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension FoodJournalViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, MealCellDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dateCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath) as! FoodJournalDateCell
        dateCell.delegate = self
        return dateCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 40, height: 170)
    }
    
    
}
