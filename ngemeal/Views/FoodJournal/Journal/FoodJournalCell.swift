//
//  FoodJournalCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class FoodJournalDateCell: UICollectionViewCell {
    
    var delegate: MealCellDelegate?
    
    var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Momday, Oct 15, 2018" //Turn this to date later on
        lbl.font = UIFont(name: "Avenir-Light", size: 20)
        lbl.textColor = #colorLiteral(red: 0.2901960784, green: 0.2901960784, blue: 0.2901960784, alpha: 1)
        return lbl
    }()
    
    var mealCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        mealCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        mealCollectionView.dataSource = self
        mealCollectionView.delegate = self
        mealCollectionView.backgroundColor = .clear
        mealCollectionView.register(MealCell.self, forCellWithReuseIdentifier: "mealCell")
        mealCollectionView.isPagingEnabled = true
        
        self.addSubview(dateLabel)
        self.addSubview(mealCollectionView)
        
        setupDateLabelConstraint()
        setupCollectionViewConstraint()
    }
    
    func setupDateLabelConstraint() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    func setupCollectionViewConstraint() {
        mealCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mealCollectionView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 0).isActive = true
        mealCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        mealCollectionView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        mealCollectionView.heightAnchor.constraint(equalToConstant: self.frame.height-40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FoodJournalDateCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let mealCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mealCell", for: indexPath) as! MealCell
        return mealCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.navigateToDetail()
        } else {
            print("Delegate not found ☹️")
        }
    }
    
}