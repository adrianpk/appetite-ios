//
//  EditRecipeViewController-Pickers.swift
//  Appetite
//
//  Created by Adrian on 12/3/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension EditIngredientViewController {

  func fillPickers() {
    fillUnitPicker()
  }
  
  func fillUnitPicker() {
    self.quantityUnitPicker.delegate = self
    self.quantityUnitPicker.dataSource = self
    guard let _ = self.unitPickerData else {
      let units = UnitFinder.all()
      self.unitPickerData = Mapper.extractNames(units: units)
      return
    }
  }
  
  func hidePickerStacks() {
    self.quantityUnitPicker.isHidden = true
  }
  
  func resetPickers() {
    self.resetUnitPicker()
    self.view.layoutIfNeeded()
  }
  
  func updatePickerButtons() {
    self.updateUnitPickerButton()
  }
  
  func updateUnitPickerButton(){
    if let unit = self.ingredient!.quantityUnit {
      self.quantityUnitButton.setTitle(unit.name, for: UIControlState.normal)
    }
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    if pickerView == self.quantityUnitPicker.picker {
      return 1
    } else {
      return 1
    }
  }
  
  // The number of rows of data
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView == self.quantityUnitPicker.picker {
      return self.unitPickerData!.count
    } else {
      return 0
    }
  }
  
  // The data to return for the row and component (column) that's being passed in
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView == self.quantityUnitPicker.picker {
      return self.unitPickerData![row]
    } else {
      return nil
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let updater = {
      if pickerView == self.quantityUnitPicker.picker {
        self.ingredient!.quantityUnit = UnitFinder.find(name: self.unitPickerData![row])
        self.ingredient!.quantityUnitName = self.ingredient!.quantityUnit!.name
        self.quantityUnitButton.setTitle(self.ingredient!.quantityUnitName, for: UIControlState.normal)
        
      } else {
        //return nil
      }
    }
    IngredientManager.update(self.ingredient!, updater: updater)
  }

  @IBAction func showUnitPickerStack(_ sender: Any) {
    self.hidePickerStacks()
    //self.unitPickerStackView.alpha = 0.8
    self.quantityUnitPicker.isHidden = false
  }
  
  @IBAction func closeUnitPickerStack(_ sender: Any) {
    self.quantityUnitPicker.isHidden = true
  }

  func resetUnitPicker() {
    self.quantityUnitButton.titleLabel!.text = I18N.Text.unit.value
    self.quantityUnitPicker.picker.selectRow(0, inComponent: 0, animated: false)
  }
  
}
