//
//  EditRecipeViewController.swift
//  Appetite
//
//  Created by Adrian on 11/15/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import RealmSwift
import Controls

class EditRecipeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, RecipeControllerDelegate {

  var scrollView: UIScrollView!
  var mainStack: Stack!
  // Status
  var statusBar: StatusBar!
  // Fields
  @IBOutlet weak var clearRecipeButton: UIBarButtonItem!
  var cookbookTextFieldStack: TextFieldStack!
  var nameTextFieldStack: TextFieldStack!
  var infoTextViewStack: TextViewStack!
  var yieldQuantityTextField: TextField!
  var yieldUnitButton: Button!
  var preparationTimeButton: Button!
  var cookingTimeButton: Button!
  // Image
  var imageViewStack: ImageViewStack!
  var takePictureImageButton: Button!
  var selectImageButton: Button!
  var deleteImageButton: Button!
  // Fields
  var authorTextFieldStack: TextFieldStack!
  var sourceTextFieldStack: TextFieldStack!
  var sourceURLTextFieldStack: TextFieldStack!
  var notesTextViewStack: TextViewStack!
  var tagsTextFieldStack: TextFieldStack!
  // Classification
  var categoryButton: Button!
  var cuisineButton: Button!
  var styleButton: Button!
  var lifestyleButton: Button!
  // Pickers
  var yieldUnitPicker: PickerStack!
  var preparationTimePicker: PickerStack!
  var cookingTimePicker: PickerStack!
  var categoryPicker: PickerStack!
  var cuisinePicker: PickerStack!
  var stylePicker: PickerStack!
  var lifestylePicker: PickerStack!
  // Segues and Actions
  var actionsStack: Stack!
  var ingredientsButton: Button!
  var directionsButton: Button!
  var saveButton: Button!
  // Validations
  var status: [Status] = []
  // Model and View
  var recipe: Recipe?
  // Data for Pickers
  var timePickerData = [Constant.ListData.hours.value, Constant.ListData.minutes_5.value]
  
  override func viewDidLoad() {
    super.viewDidLoad() 
    self.layout()
    self.addGestureRecognizers()
    self.setupNavigationBar()
    self.fillPickers()
    self.hidePickerStacks()
    self.setupImageRelatedViews()
    self.setupNewRecipe()
    // MARK: - Mock Data (delete on production)
    self.loadMockRecipe()
    // MARK: - Update form
    self.updateFormWithRecipeValues()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.handleDelegate()
    view.setNeedsLayout()
  }
  
  func loadMockRecipe() {
    self.recipe = RecipeFinder.find(name: "Lasagna")
  }
  
  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func setupNavigationBar() {
    setupNavigationBarTitle()
  }
  
  func setupNavigationBarTitle() {
    self.navigationItem.title = "Edit Recipe"
  }
  
  func setupNewRecipe() {
    self.recipe = RecipeManager.create()
  }
  
  @IBAction func clearRecipe(_ sender: Any) {
    self.setupNewRecipe()
    self.clearRecipeForm()
  }
  
  func clearRecipeForm() {
    self.cookbookTextFieldStack.textField.text = nil
    self.nameTextFieldStack.textField.text = nil
    self.yieldQuantityTextField.text = nil
    self.resetPickers()
  }
  
  func saveRecipe(_ sender: Any) {
    RealmManager.save(self.recipe!, updater: getRecipeWithFormValuesUpdater())
  }
  
  func getRecipeWithFormValuesUpdater() -> () -> Void {
    return self.updateRecipeWithFormValues
  }
  
  func updateRecipeWithFormValues() {
    if let recipe = self.recipe {
      recipe.cookbook = self.cookbookTextFieldStack.textField.text!
      recipe.name = self.nameTextFieldStack.textField.text!
      recipe.info = self.infoTextViewStack.textView.text
      recipe.yieldValue = Converter.toDouble(self.yieldQuantityTextField.text!)
      recipe.author = self.authorTextFieldStack.text!
      recipe.source = self.sourceTextFieldStack.text!
      recipe.sourceURL = self.sourceURLTextFieldStack.text!
      recipe.notes = self.notesTextViewStack.text
      recipe.defaultsForCreate()
    }
  }
  
  func updateFormWithRecipeValues() {
    if let recipe = self.recipe {
      self.cookbookTextFieldStack.textField.text = recipe.cookbook
      self.nameTextFieldStack.textField.text = recipe.name
      self.infoTextViewStack.text = recipe.info
      self.yieldQuantityTextField.text = "\(recipe.yieldValue)"
      self.authorTextFieldStack.text = recipe.author
      self.sourceTextFieldStack.text = recipe.source
      self.sourceURLTextFieldStack.text = recipe.sourceURL
      self.notesTextViewStack.text = recipe.notes
    }
  }

  func showAddIngredientsTable(_ sender: Any) {
    let viewController = IngredientsTableViewController()
    viewController.delegate = self
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
  func showAddDirectionsTable(_ sender: Any) {
    let viewController = TestViewController()
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
  // MARK: Delegate
  // MARK: - Delegate related
  func handleDelegate() {
    self.processStatus()
  }
  
  internal func getRecipe() -> Recipe {
    return self.recipe!
  }
  
  internal func getSelectedIngredient() -> Ingredient? {
    return nil
  }
  
  internal func setStatus(status: [Status]) {
    self.status = status
  }
  
  internal func getStatus() -> [Status] {
    return self.status
  }
  
  func completed(recipe: Recipe) {
    //
  }

}
