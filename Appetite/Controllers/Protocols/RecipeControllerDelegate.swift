//
//  RecipeControllerDelegate.swift
//  Appetite
//
//  Created by Adrian on 11/29/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import Controls

protocol RecipeControllerDelegate {
  func getRecipe() -> Recipe
  func getSelectedIngredient() -> Ingredient?
  func getStatus() -> [Status]
  func setStatus(status: [Status])
  func completed(recipe: Recipe)
}
