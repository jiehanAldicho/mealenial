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
    var journalData = [Any]()
    
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

//        let JournalData = journalData[0] as! [String: Any]
//        let nutritions = JournalData["nutritions"] as! [String:Any]
//        let carbs = nutritions["carbs"]
//        let protein = nutritions["protein"]
//        let vegetable = nutritions["vegetable"]
//        let imgURL = JournalData["image_url"]
//        let date = JournalData["date"]
//        let url = URL(string: imgURL as! String)
//        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//        foodCell.receivedImg = UIImage(data: data!)!
        foodCell.nutritionStack.stapLabel.text = "40%"
        foodCell.nutritionStack.proLabel.text = "40%"
        foodCell.nutritionStack.vegLabel.text = "20%"
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let dateString = formatter.string(from: Date())
        foodCell.timeStamp.timeLabel.text = "\(dateString)" //Ini harus diformat dulu 💩
        
        return foodCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 342, height: 550)
    }
}
