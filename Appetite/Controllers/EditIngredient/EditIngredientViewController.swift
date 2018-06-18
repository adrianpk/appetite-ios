//
//  EditIngredientViewController.swift
//  Appetite
//
//  Created by Adrian on 12/2/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

class EditIngredientViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

  var scrollView: UIScrollView!
  var mainStack: Stack!
  // Navigation menu items
  var clearIngredientButton: UIBarButtonItem!
  // Status
  var statusBar: StatusBar!
  // Fields
  var groupTextField: TextFieldStack!
  var quantityTextField: TextField!
  var quantityUnitButton: Button!
  var nameTextField: TextField!
  var isOptionalSwitch: SwitchStack!
  // Picker Stack Views
  var quantityUnitPicker: PickerStack!
  var unitPickerData: [String]?
  // Segues and Actions
  var actionsStack: Stack!
  var saveButton: Button!
  // Validations
  var status: [Status] = []
  // Recipe & Ingredient
  var recipe: Recipe?
  var delegate: RecipeControllerDelegate?
  var ingredient: Ingredient?

  override func viewDidLoad() {
    super.viewDidLoad()
    layout()
    addGestureRecognizers()
    fillPickers()
    hidePickerStacks()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.handleDelegate()
    self.updatePickerButtons()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Navigation
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  /*
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Name.Segue.showIngredientsTable.value {
      if let vc = segue.destination as? IngredientsTableViewController {
        vc.delegate = self
      }
    }
  }*/
  
  func setMockStatus() {
    let message1 = Status(message: "Hay que revisar algo.", kind: .error)
    let message2 = Status(message: "Varias cosas.", kind: .error)
    self.status.append(message1)
    self.status.append(message2)
  }
  
  // MARK: - Delegate related
  func handleDelegate() {
    if let delegate = self.delegate {
      self.status = delegate.getStatus()
      self.recipe = delegate.getRecipe()
      switch delegate.getSelectedIngredient() {
        case nil:
          self.setupNewIngredient()
        default:
          self.ingredient = delegate.getSelectedIngredient()
      }
      self.updateFormWithIngredientValues()
      self.processStatus()
    }
  }
  
  func setupNewIngredient() {
    self.ingredient = IngredientManager.create()
  }
  
  @IBAction func clearIngredient(_ sender: Any) {
    self.setupNewIngredient()
    self.clearRecipeForm()
  }
  
  func clearRecipeForm() {
    self.groupTextField.text = nil
    self.quantityTextField.text = nil
    self.resetPickers()
    self.nameTextField.text = nil
  }
  
  @IBAction func saveIngredient(_ sender: Any) {
    switch self.validateForm() {
      case Status.Kind.error:
        self.statusBar.setStatus(self.status)
      default:
        RealmManager.save(self.recipe!, update: true, updater: self.getIngredientWithFormValuesUpdater())
        self.setSavedStatus()
        self.delegate?.setStatus(status: self.status)
        _ = self.navigationController?.popViewController(animated: true)
    }
  }
  
  func setSavedStatus() {
    self.status.append(Status(message: "Saved!", kind: .info))
  }

  func getIngredientWithFormValuesUpdater() -> () -> Void {
    return self.updateIngredientWithFormValues
  }
  
  func updateIngredientWithFormValues() {
    if let ingredient = self.ingredient {
      ingredient.group = self.groupTextField.text!
      ingredient.quantity = Converter.toDouble(self.quantityTextField.text!)
      ingredient.name = self.nameTextField.text!
      ingredient.isOptional = self.isOptionalSwitch.isOn
      ingredient.defaultsForCreate()
      guard let _ = ingredient.recipe.first else {
        self.recipe!.ingredients.append(ingredient)
        return
      }
    }
  }
  
  func updateFormWithIngredientValues() {
    if let ingredient = self.ingredient {
      self.groupTextField.text = ingredient.group
      self.quantityTextField.text = "\(ingredient.quantity)"
      self.nameTextField.text = ingredient.name
      self.isOptionalSwitch.isOn = ingredient.isOptional
    }
  }
  
  func getRecipeWithFormValuesUpdater() -> () -> Void {
    return self.updateRecipeWithFormValues
  }
  
  func updateRecipeWithFormValues() {
    if let recipe = self.recipe {
      recipe.ingredients.append(self.ingredient!)
    }
  }

}
