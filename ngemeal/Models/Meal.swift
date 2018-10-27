//
//  NutritionalContent.swift
//  ngemeal
//
//  Created by Andy Jiehan Aldicho on 17/10/18.
//  Copyright © 2018 Primy Peluncuran Indonesia. All rights reserved.
//

import Foundation

class Meal {
  var nutritionDict = ["Vegetable": 0,
                       "Protein": 0,
                       "Staple": 0]
  var time = String() //This will be date object later on
  var mealType = String()
  
  init(_ time: String, _ mealType: String) {
    self.time = time
    self.mealType = mealType
  }
}
