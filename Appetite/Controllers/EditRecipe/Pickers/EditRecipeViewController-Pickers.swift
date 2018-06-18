//
//  EditRecipeViewController-Pickers.swift
//  Appetite
//
//  Created by Adrian on 11/17/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension EditRecipeViewController {
  
  func fillPickers() {
    fillUnitPicker()
    fillPreparationTimePicker()
    fillCookingTimePicker()
    fillCategoryPicker()
    fillCuisinePicker()
    fillStylePicker()
    fillLifestylePicker()
  }
  
  func fillUnitPicker() {
    self.yieldUnitPicker.delegate = self
    self.yieldUnitPicker.dataSource = self
    let units = UnitFinder.all()
    self.yieldUnitPicker.selectionData[0] = Mapper.extractNames(units: units)
  }
  
  func fillPreparationTimePicker() {
    self.preparationTimePicker.delegate = self
    self.preparationTimePicker.dataSource = self
    self.preparationTimePicker.selectionData = self.timePickerData
  }
  
  func fillCookingTimePicker() {
    self.cookingTimePicker.delegate = self
    self.cookingTimePicker.dataSource = self
    self.cookingTimePicker.selectionData = self.timePickerData
  }
  
  func fillCategoryPicker() {
    self.categoryPicker.delegate = self
    self.categoryPicker.dataSource = self
    let categories = ClassificationFinder.all(ofType: App.ClassificationType.category.value)
    self.categoryPicker.selectionData[0] = Mapper.extractNames(classifications: categories)
  }
  
  func fillCuisinePicker() {
    self.cuisinePicker.delegate = self
    self.cuisinePicker.dataSource = self
    let cuisines = ClassificationFinder.all(ofType: App.ClassificationType.cuisine.value)
    self.cuisinePicker.selectionData[0] = Mapper.extractNames(classifications: cuisines)
  }
  
  func fillStylePicker() {
    self.stylePicker.delegate = self
    self.stylePicker.dataSource = self
    let styles = ClassificationFinder.all(ofType: App.ClassificationType.style.value)
    self.stylePicker.selectionData[0] = Mapper.extractNames(classifications: styles)
  }
  
  func fillLifestylePicker() {
    self.lifestylePicker.delegate = self
    self.lifestylePicker.dataSource = self
    let lifestyles = ClassificationFinder.all(ofType: App.ClassificationType.lifestyle.value)
    self.lifestylePicker.selectionData[0] = Mapper.extractNames(classifications: lifestyles)
  }
  
  func hidePickerStacks() {
    self.yieldUnitPicker.isHidden = true
    self.preparationTimePicker.isHidden = true
    self.cookingTimePicker.isHidden = true
    self.cookingTimePicker.isHidden = true
    self.categoryPicker.isHidden = true
    self.cuisinePicker.isHidden = true
    self.stylePicker.isHidden = true
    self.lifestylePicker.isHidden = true
  }
  
  func resetPickers() {
    self.resetYieldUnitPicker()
    self.resetPreparationTimePicker()
    self.resetCookingTimePicker()
    self.resetCategoryPicker()
    self.resetCookingTimePicker()
    self.resetStylePicker()
    self.resetLifestylePicker()
    self.view.layoutIfNeeded()
  }
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    if pickerView == self.yieldUnitPicker.picker {
      return 1
    } else if pickerView == self.preparationTimePicker.picker {
      return 2
    } else if pickerView == self.cookingTimePicker.picker {
      return 2
    } else {
      return 1
    }
  }
  
  // The number of rows of data
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if pickerView == self.yieldUnitPicker.picker {
      return self.yieldUnitPicker.selectionData[0].count
    } else if pickerView == self.preparationTimePicker.picker {
      if component == 0 {
        return self.preparationTimePicker.selectionData[0].count
      } else {
        return self.preparationTimePicker.selectionData[1].count
      }
    } else if pickerView == self.cookingTimePicker.picker {
      if component == 0 {
        return self.cookingTimePicker.selectionData[0].count
      } else {
        return self.cookingTimePicker.selectionData[1].count
      }
    } else if pickerView == self.categoryPicker.picker {
      return self.categoryPicker.selectionData[0].count
    } else if pickerView == self.cuisinePicker.picker {
      return self.cuisinePicker.selectionData[0].count
    } else if pickerView == self.stylePicker.picker {
      return self.stylePicker.selectionData[0].count
    } else if pickerView == self.lifestylePicker.picker {
      return self.lifestylePicker.selectionData[0].count
    } else {
      return 0
    }
  }
  
  // The data to return for the row and component (column) that's being passed in
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if pickerView == self.yieldUnitPicker.picker {
      return self.yieldUnitPicker.selectionData[component][row]
    } else if pickerView == self.preparationTimePicker.picker {
      return self.preparationTimePicker.selectionData[component][row]
    } else if pickerView == self.cookingTimePicker.picker {
      return self.cookingTimePicker.selectionData[component][row]
    } else if pickerView == self.categoryPicker.picker {
      return self.categoryPicker.selectionData[component][row]
    } else if pickerView == self.cuisinePicker.picker {
      return self.cuisinePicker.selectionData[component][row]
    } else if pickerView == self.stylePicker.picker {
      return self.stylePicker.selectionData[component][row]
    } else if pickerView == self.lifestylePicker.picker {
      return self.lifestylePicker.selectionData[component][row]
    } else {
      return nil
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let updater = {
      if pickerView == self.yieldUnitPicker.picker {
        self.recipe!.yieldUnit = UnitFinder.find(name: self.yieldUnitPicker.selectionData[0][row])
        self.recipe!.yieldUnitName = self.recipe!.yieldUnit!.name
        self.yieldUnitButton.setTitle(self.recipe!.yieldUnitName, for: UIControlState.normal)
      
      } else if pickerView == self.preparationTimePicker.picker {
        self.updatePreparationTimeButton(didSelectRow: row, inComponent: component)
        
      } else if pickerView == self.cookingTimePicker.picker {
        self.updateCookingTimeButton(didSelectRow: row, inComponent: component)
        
      } else if pickerView == self.categoryPicker.picker {
        self.recipe!.category = ClassificationFinder.find(byType: App.ClassificationType.category.value, name: self.categoryPicker.selectionData[0][row])
        self.recipe!.categoryName = self.recipe!.category!.name
        self.categoryButton.setTitle(self.recipe!.categoryName, for: UIControlState.normal)
        
      } else if pickerView == self.cuisinePicker.picker {
        self.recipe!.cuisine = ClassificationFinder.find(byType: App.ClassificationType.cuisine.value, name: self.cuisinePicker.selectionData[0][row])
        self.recipe!.cuisineName = self.recipe!.cuisine!.name
        self.cuisineButton.setTitle(self.recipe!.cuisineName, for: UIControlState.normal)
        
      } else if pickerView == self.stylePicker.picker {
        self.recipe!.style = ClassificationFinder.find(byType: App.ClassificationType.style.value, name: self.stylePicker.selectionData[0][row])
        self.recipe!.styleName = self.recipe!.style!.name
        self.styleButton.setTitle(self.recipe!.styleName, for: UIControlState.normal)
        
      } else if pickerView == self.lifestylePicker.picker {
        self.recipe!.lifestyle = ClassificationFinder.find(byType: App.ClassificationType.lifestyle.value, name: self.lifestylePicker.selectionData[0][row])
        self.recipe!.lifestyleName = self.recipe!.lifestyle!.name
        self.lifestyleButton.setTitle(self.recipe!.lifestyleName, for: UIControlState.normal)
        
      } else {
        //return nil
      }
    }
    RecipeManager.update(self.recipe!, updater: updater)
  }
  
  func updatePreparationTimeButton(didSelectRow row: Int, inComponent component: Int) {
    if component == 0 {
      self.recipe!.preparationTimeHours = Converter.toInt(self.timePickerData[component][row])
    } else if component == 1 {
      self.recipe!.preparationTimeMinutes = Converter.toInt(self.timePickerData[component][row])
    }
    let title = self.recipe!.formattedPreparationTime()
    if(title != Recipe.zeroFormattedTime()) {
      self.preparationTimeButton.setTitle(title, for: UIControlState.normal)
    } else {
      self.preparationTimeButton.setTitle(I18N.Text.preparation.value, for: UIControlState.normal)
    }
  }
  
  func updateCookingTimeButton(didSelectRow row: Int, inComponent component: Int) {
    if component == 0 {
      self.recipe!.cookingTimeHours = Converter.toInt(self.timePickerData[component][row])
    } else if component == 1 {
      self.recipe!.cookingTimeMinutes = Converter.toInt(self.timePickerData[component][row])
    }
    let title = self.recipe!.formattedCookingTime()
    if(title != Recipe.zeroFormattedTime()) {
      self.cookingTimeButton.setTitle(title, for: UIControlState.normal)
    } else {
      self.cookingTimeButton.setTitle(I18N.Text.cooking.value, for: UIControlState.normal)
    }
  }
  
  // Unit Picker
  func showUnitPickerStack(_ sender: Any) {
    self.hidePickerStacks()
    self.yieldUnitPicker.isHidden = false
  }
  
  func closeYieldUnitPickerStack(_ sender: Any) {
    self.yieldUnitPicker.isHidden = true
  }
  
  func resetYieldUnitPicker() {
    self.yieldUnitButton.titleLabel!.text = I18N.Text.unit.value
    self.yieldUnitPicker.picker.selectRow(0, inComponent: 0, animated: false)
  }
  
  // Preparation Time Picker
  func showPreparationTimePicker(_ sender: Any) {
    self.hidePickerStacks()
    self.preparationTimePicker.isHidden = false
  }
  
  func closePreparationPicker(_ sender: Any) {
    self.preparationTimePicker.isHidden = true
  }
  
  func resetPreparationTimePicker() {
    self.preparationTimeButton.titleLabel!.text = I18N.Text.preparation.value
    self.preparationTimePicker.picker.selectRow(0, inComponent: 0, animated: false)
    self.preparationTimePicker.picker.selectRow(0, inComponent: 1, animated: false)
  }
  
  // Cooking Time Picker
  func showCookingTimePicker(_ sender: Any) {
    self.hidePickerStacks()
    self.cookingTimePicker.isHidden = false
  }
  
  func closeCookingTimePicker(_ sender: Any) {
    self.cookingTimePicker.isHidden = true
  }
  
  func resetCookingTimePicker() {
    self.cookingTimeButton.titleLabel!.text = I18N.Text.cooking.value
    self.cookingTimePicker.selectRow(0, inComponent: 0, animated: false)
    self.cookingTimePicker.selectRow(0, inComponent: 1, animated: false)
  }
  
  // Category Stack View
  func showCategoryPicker(_ sender: Any) {
    self.hidePickerStacks()
    self.categoryPicker.isHidden = false
  }
  
  func closeCategoryPicker(_ sender: Any) {
    self.categoryPicker.isHidden = true
  }
  
  func resetCategoryPicker() {
    self.categoryButton.titleLabel!.text = I18N.Text.category.value
    self.categoryPicker.selectRow(0, inComponent: 0, animated: false)
  }
  
  // Cuisine Stack View
  func showCuisinePicker(_ sender: Any) {
    self.hidePickerStacks()
    self.cuisinePicker.isHidden = false
  }
  
  func closeCuisinePicker(_ sender: Any) {
    self.cuisinePicker.isHidden = true
  }
  
  func resetCuisinePicker() {
    self.cuisineButton.titleLabel!.text = I18N.Text.cuisine.value
    self.cuisinePicker.selectRow(0, inComponent: 0, animated: false)
  }
  
  // Style Stack View
  func showStylePicker(_ sender: Any) {
    self.hidePickerStacks()
    self.stylePicker.isHidden = false
  }
  
  func closeStylePicker(_ sender: Any) {
    self.stylePicker.isHidden = true
  }

  func resetStylePicker() {
    self.styleButton.titleLabel!.text = I18N.Text.style.value
    self.stylePicker.selectRow(0, inComponent: 0, animated: false)
  }
  
  // Lifestyle
  func showLifestylePicker(_ sender: Any) {
    self.hidePickerStacks()
    self.lifestylePicker.isHidden = false
  }
  
  func closeLifestylePicker(_ sender: Any) {
    self.lifestylePicker.isHidden = true
  }
  
  func resetLifestylePicker() {
    self.lifestyleButton.titleLabel!.text = I18N.Text.lifestyle.value
    self.lifestylePicker.selectRow(0, inComponent: 0, animated: false)
  }
  
}
