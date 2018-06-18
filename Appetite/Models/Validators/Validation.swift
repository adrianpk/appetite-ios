//
//  Validation.swift
//  Appetite
//
//  Created by Adrian on 12/5/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation

struct Validation {
  var isValid: Bool
  var errors: [String]
  
  mutating func invalidate() {
    self.isValid = false
  }
  
  mutating func reset() {
    self.isValid = true
    self.errors = []
  }
  
  mutating func addError(error: String) {
    self.invalidate()
    self.errors.append(error)
  }

}
