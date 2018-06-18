//
//  EditIngredientViewController-Validations.swift
//  Appetite
//
//  Created by Adrian on 12/5/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

extension EditIngredientViewController {

  func hideStatusBar() {
    self.statusBar.hide()
  }
  
  func validateForm() -> Status.Kind {
    self.clearStatus()
    self.validateQuantity()
    self.validateName()
    return Form.status(self.status)
  }
  
  func clearStatus() {
    self.status = []
    self.quantityTextField.clear()
    self.nameTextField.clear()
  }
  
  func validateQuantity() {
    self.quantityTextField.validateNonEmpty(message: I18N.Message.quantity_empty_error.value)
    if let statusMessage = self.quantityTextField.getStatus() {
      self.appendStatus(statusMessage)
    }
  }
  
  func validateName() {
    self.nameTextField.validateNonEmpty(message: I18N.Message.name_empty_error.value)
    if let statusMessage = self.nameTextField.getStatus() {
      self.appendStatus(statusMessage)
    }
  }
  
  func appendStatus(_ statusMessage: Status){
    self.status.append(statusMessage)
  }

}
