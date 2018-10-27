//
//  HomeViewController.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 16/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var fakeNavBar: UIView!
    
    var overviewCollectionView: UICollectionView!
    
    let currentMeal = Meal("08.00 AM", "Breakfast")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 20
        
        overviewCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        overviewCollectionView.dataSource = self
        overviewCollectionView.delegate = self
        overviewCollectionView.backgroundColor = Colors.backgroundColor
        overviewCollectionView.register(LastMealCell.self, forCellWithReuseIdentifier: "lastMealCell")
        overviewCollectionView.register(NextMealCell.self, forCellWithReuseIdentifier: "nextMealCell")
        
        fakeNavBar = addCustomNavbar("Overview")
        self.view.addSubview(overviewCollectionView)
        
        setupCollectionViewConstraint()
    }
    
    func setupCollectionViewConstraint() {
        overviewCollectionView.translatesAutoresizingMaskIntoConstraints = false
        overviewCollectionView.topAnchor.constraint(equalTo: fakeNavBar.bottomAnchor, constant: 0).isActive = true
        overviewCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        overviewCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: (tabBarHeight! * -1)).isActive = true
        overviewCollectionView.layer.zPosition = -1
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let lastMealCell = collectionView.dequeueReusableCell(withReuseIdentifier: "lastMealCell", for: indexPath) as! LastMealCell
            lastMealCell.meal = currentMeal
            return lastMealCell
        } else {
            let nextMealCell = collectionView.dequeueReusableCell(withReuseIdentifier: "nextMealCell", for: indexPath) as! NextMealCell
            nextMealCell.meal = currentMeal
            nextMealCell.delegate = self
            return nextMealCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return CGSize(width: 342, height: 223)
        } else {
            return CGSize(width: 342, height: 305)
        }
    }
}

extension HomeViewController: NextMealCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func takeCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let classTetangga = InputFoodViewController()
        let imageFoto = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        classTetangga.imageVar = imageFoto
        
        self.navigationController?.pushViewController(classTetangga, animated: true)
        
        dismiss(animated:true, completion: nil)
    }
}
