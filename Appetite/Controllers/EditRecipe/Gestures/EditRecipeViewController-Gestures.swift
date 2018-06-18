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

extension EditRecipeViewController: UIGestureRecognizerDelegate {

  func addGestureRecognizers() {
    self.addYieldUnitGestureRecognizer()
    self.addPreparationTimeGestureRecognizer()
    self.addCookingTimeGestureRecognizer()
    self.addCategoryGestureRecognizer()
    self.addCuisineGestureRecognizer()
    self.addStyleGestureRecognizer()
    self.addLifestyleGestureRecognizer()
    self.addIngredientsGestureRecognizer()
    self.addDirectionsGestureRecognizer()
    self.addSaveGestureRecognizer()
  }
  
  func addYieldUnitGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showUnitPickerStack))
    tapRecognizer.delegate = self
    self.yieldUnitButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addPreparationTimeGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showPreparationTimePicker))
    tapRecognizer.delegate = self
    self.preparationTimeButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addCookingTimeGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCookingTimePicker))
    tapRecognizer.delegate = self
    self.cookingTimeButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addCategoryGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCategoryPicker))
    tapRecognizer.delegate = self
    self.categoryButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addCuisineGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showCuisinePicker))
    tapRecognizer.delegate = self
    self.cuisineButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addStyleGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showStylePicker))
    tapRecognizer.delegate = self
    self.styleButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addLifestyleGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showLifestylePicker))
    tapRecognizer.delegate = self
    self.lifestyleButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addIngredientsGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showAddIngredientsTable))
    tapRecognizer.delegate = self
    self.ingredientsButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addDirectionsGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(showAddDirectionsTable))
    tapRecognizer.delegate = self
    self.directionsButton.addGestureRecognizer(tapRecognizer)
  }
  
  func addSaveGestureRecognizer() {
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(saveRecipe))
    tapRecognizer.delegate = self
    self.saveButton.addGestureRecognizer(tapRecognizer)
  }

}
