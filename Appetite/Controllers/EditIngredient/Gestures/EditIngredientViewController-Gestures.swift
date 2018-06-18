//
//  EditIngredientViewController-Gestures.swift
//  Appetite
//
//  Created by Adrian on 1/10/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit
import UIKit
import Controls

extension EditIngredientViewController: UIGestureRecognizerDelegate {

  func addGestureRecognizers() {
    self.addPasteListGestureRecognizer()
    self.addAddIngredientGestureRecognizer()
  }

  func addPasteListGestureRecognizer() {
//    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToAddIngredientsTable))
//    tapRecognizer.delegate = self
//    self.ingredientsButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addAddIngredientGestureRecognizer() {
//    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToAddDirectionsTable))
//    tapRecognizer.delegate = self
//    self.directionsButton.addGestureRecognizer(tapRecognizer)
  }

}
