//
//  EditRecipeViewController-Gestures.swift
//  Appetite
//
//  Created by Adrian on 1/10/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

import UIKit
import Controls

extension IngredientsTableViewController: UIGestureRecognizerDelegate {

  func addGestureRecognizers() {
    self.addPasteListGestureRecognizer()
    self.addAddIngredientGestureRecognizer()
  }

  func addPasteListGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPasteList))
    tapRecognizer.delegate = self
    self.pasteListButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addAddIngredientGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showAddIngredient))
    tapRecognizer.delegate = self
    self.addIngredientButton.addGestureRecognizer(tapRecognizer)
  }

}
