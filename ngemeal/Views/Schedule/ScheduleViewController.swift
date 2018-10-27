//
//  ScheduleViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan on 25/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var scheduleCollectionView: UICollectionView!

    override func viewDidLoad() {
        self.tabBarController?.tabBar.isHidden = false
        
        super.viewDidLoad()
//        self.setCustomNavbar()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 20
        
        scheduleCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        scheduleCollectionView.dataSource = self
        scheduleCollectionView.delegate = self
        scheduleCollectionView.backgroundColor = Colors.backgroundColor
        scheduleCollectionView.register(ScheduleCollectionViewCell.self, forCellWithReuseIdentifier: "scheduleCell")
        
        view.addSubview(scheduleCollectionView)
        
    }

}

extension ScheduleViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "scheduleCell", for: indexPath) as! ScheduleCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 125)
    }
}