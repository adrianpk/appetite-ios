//
//  IngredientValidator.swift
//  Appetite
//
//  Created by Adrian on 12/5/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class IngredientValidator: ModelValidator {

  class func validateForCreate(_ ingredient: Ingredient) -> Validation {
    let validation = ModelValidator.validateNotEmpty(ingredient.name)
    return validation
  }

}
