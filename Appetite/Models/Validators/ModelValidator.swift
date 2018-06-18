//
//  ModelValidator
//  Appetite
//
//  Created by Adrian on 12/5/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class ModelValidator {
  
  static let valid = Validation(isValid: true, errors: [])

  class func validateNotEmpty(_ string: String?, validation: Validation = ModelValidator.valid) -> Validation {
    guard let s = string, !s.isEmpty else {
      var updatedValidation = validation
      updatedValidation.addError(error: "Name cannot be empty.")
      return updatedValidation
    }
    return validation
  }

}
