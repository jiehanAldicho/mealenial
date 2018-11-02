//
//  MealCell.swift
//  ngemeal
//
//  Created by Andy Jiehan on 23/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

protocol MealCellDelegate {
    func navigateToDetail(indexPath: IndexPath)
}

class MealCell: UICollectionViewCell {
    
    var imgBG: UIImageView!
    var timeLblView: TimeStampView!
    
//    var delegate: MealCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        timeLblView = TimeStampView(frame: self.frame, time: Date())
        
        let img = UIImage(named: "makanan") //This should be from meal model
        imgBG = UIImageView(image: img)
        imgBG.clipsToBounds = true
        imgBG.contentMode = .scaleAspectFill
        imgBG.layer.cornerRadius = 7
        
        
        self.layer.cornerRadius = 7
        
        self.addSubview(imgBG)
        self.addSubview(timeLblView!)
        
        setupImageBGConstraint()
        setupTimeStampConstraint()
    }
    
    func setupTimeStampConstraint() {
        timeLblView?.translatesAutoresizingMaskIntoConstraints = false
        timeLblView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        timeLblView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        timeLblView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        timeLblView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupImageBGConstraint() {
        imgBG?.translatesAutoresizingMaskIntoConstraints = false
        imgBG?.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imgBG?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imgBG?.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        imgBG?.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
