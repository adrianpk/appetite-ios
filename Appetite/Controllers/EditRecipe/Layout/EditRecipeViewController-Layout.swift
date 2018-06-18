//
//  EditRecipeViewController-Layout.swift
//  Appetite
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

extension EditRecipeViewController {

  func layout(){
    configView()
    addStatusBar()
    addScrollView()
    addMainStack()
    addCookbookStack()
    addNameStack()
    addDescriptionStack()
    addYieldStack()
    addTimeStack()
    addImageStack()
    addAuthorStack()
    addSourceStack()
    addSourceURLStack()
    addNotesStack()
    addTagsStack()
    addClassificationStack()
    addActionsStack()
    addPickerStacks()
    finalViewSetup()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }
  
  func configView() {
    view.backgroundColor = UX.Palette.viewBackground.uicolor
  }
  
  func addStatusBar() {
    statusBar = ControlsFactory.buildStatusBar()
    ControlsFactory.arrangeView(statusBar, into: view)
    statusBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
  }

  func addScrollView() {
    let params = Default.scrollViewParams()
    scrollView = ControlsFactory.buildScrollView(params)
    view.addSubview(scrollView)
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    scrollView.topAnchor.constraint(equalTo: statusBar.bottomAnchor, constant: UX.Measurement.spacing.cgFloat).isActive = true
  }
  
  func addMainStack() {
    let params = Default.mainStackParams()
    mainStack = ControlsFactory.buildVerticalStack(params)
    ControlsFactory.arrangeStack(mainStack, into: scrollView, params: params)
  }
  
  func addCookbookStack() {
    let params = Default.textFieldStackParams(title: "Cookbook", placeholder: "Comma separated.")
    cookbookTextFieldStack = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(cookbookTextFieldStack, into: mainStack)
  }
  
  func addNameStack() {
    let params = Default.textFieldStackParams(title: "Name")
    nameTextFieldStack = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(nameTextFieldStack, into: mainStack)
  }
  
  func addDescriptionStack() {
    let params = Default.textViewStackParams(title: "Description", size: CGSize(width: 400, height: 80))
    infoTextViewStack = ControlsFactory.buildTextViewStack(params)
    ControlsFactory.arrangeView(infoTextViewStack, into: mainStack)
  }
  
  func addYieldStack() {
    var params = Default.titleLabelParams(withText: "Yield")
    let title = ControlsFactory.buildLabel(params)
    params = Default.textFieldParams()
    yieldQuantityTextField = ControlsFactory.buildTextField(params)
    params = Default.selectorButtonParams(title: "Unit")
    yieldUnitButton = ControlsFactory.buildButton(params)
    let stack = ControlsFactory.arranged12(title, yieldQuantityTextField, yieldUnitButton)
    ControlsFactory.arrangeView(stack, into: mainStack)
  }
  
  func addTimeStack() {
    var params = Default.titleLabelParams(withText: "Time")
    let title = ControlsFactory.buildLabel(params)
    params = Default.selectorButtonParams(title: "Preparation")
    preparationTimeButton = ControlsFactory.buildButton(params)
    params.title = "Cooking"
    cookingTimeButton = ControlsFactory.buildButton(params)
    let stack = ControlsFactory.arranged12(title, preparationTimeButton, cookingTimeButton)
    ControlsFactory.arrangeView(stack, into: mainStack)
  }
  
  func addImageStack() {
    let params = Default.imageViewStackParams(title: "Picture")
    imageViewStack = ControlsFactory.buildImageViewStack(params)
    ControlsFactory.arrangeView(imageViewStack, into: mainStack)
  }
  
  func addAuthorStack() {
    let params = Default.textFieldStackParams(title: "Author")
    authorTextFieldStack = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(authorTextFieldStack, into: mainStack)
  }
  
  func addSourceStack() {
    let params = Default.textFieldStackParams(title: "Source")
    sourceTextFieldStack = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(sourceTextFieldStack, into: mainStack)
  }
  
  func addSourceURLStack() {
    let params = Default.textFieldStackParams(title: "Webpage")
    sourceURLTextFieldStack = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(sourceURLTextFieldStack, into: mainStack)
  }
  
  func addNotesStack() {
    let params = Default.textViewStackParams(title: "Notes", size: CGSize(width: 400, height: 80 ))
    notesTextViewStack = ControlsFactory.buildTextViewStack(params)
    ControlsFactory.arrangeView(notesTextViewStack, into: mainStack)
  }
  
  func addTagsStack() {
    let params = Default.textFieldStackParams(title: "Tags", placeholder: "Comma separated.")
    tagsTextFieldStack = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(tagsTextFieldStack, into: mainStack)
  }
  
  func addClassificationStack() {
    var params = Default.titleLabelParams(withText: "Classification")
    let title = ControlsFactory.buildLabel(params)
    params = Default.selectorButtonParams(title: "Category")
    categoryButton = ControlsFactory.buildButton(params)
    params.title = "Cuisine"
    cuisineButton = ControlsFactory.buildButton(params)
    params.title = "Style"
    styleButton = ControlsFactory.buildButton(params)
    params.title = "Lifestyle"
    lifestyleButton = ControlsFactory.buildButton(params)
    let stack = ControlsFactory.arranged122(title, categoryButton, cuisineButton, styleButton, lifestyleButton)
    ControlsFactory.arrangeView(stack, into: mainStack)
  }
  
  func addActionsStack() {
    var params = Default.segueButtonParams(title: "Directions")
    directionsButton = ControlsFactory.buildButton(params)
    params.title = "Ingredients"
    ingredientsButton = ControlsFactory.buildButton(params)
    params = Default.actionButtonParams(title: "Save")
    saveButton = ControlsFactory.buildButton(params)
    actionsStack = ControlsFactory.arranged21(directionsButton, ingredientsButton, saveButton)
    view.addSubview(actionsStack)
    actionsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UX.Measurement.mainLeadingMargin.cgFloat).isActive = true
    actionsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(UX.Measurement.mainTrailingMargin.cgFloat)).isActive = true
    actionsStack.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: UX.Measurement.spacing.cgFloat).isActive = true
    let tabBarHeight = tabBarSize().height
    actionsStack.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: -(tabBarHeight + 10)).isActive = true
  }
  
  func addPickerStacks() {
    addYieldUnitPickerStack()
    addPreparationTimePickerStack()
    addCookingTimePickerStack()
    addCategoryTimePickerStack()
    addCuisineTimePickerStack()
    addStyleTimePickerStack()
    addLifestyleTimePickerStack()
  }
  
  func addYieldUnitPickerStack() {
    let params = Default.pickerStackParams(title: "Unit", closeText: "Select")
    yieldUnitPicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(yieldUnitPicker, into: view)
  }
  
  func addPreparationTimePickerStack() {
    let params = Default.pickerStackParams(title: "Preparation Time", closeText: "Select")
    preparationTimePicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(preparationTimePicker, into: view)
  }
  
  func addCookingTimePickerStack() {
    let params = Default.pickerStackParams(title: "Cooking Time", closeText: "Select")
    cookingTimePicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(cookingTimePicker, into: view)
  }
  
  func addCategoryTimePickerStack() {
    let params = Default.pickerStackParams(title: "Category", closeText: "Select")
    categoryPicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(categoryPicker, into: view)
  }
  
  func addCuisineTimePickerStack() {
    let params = Default.pickerStackParams(title: "Cuisine", closeText: "Select")
    cuisinePicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(cuisinePicker, into: view)
  }
  
  func addStyleTimePickerStack() {
    let params = Default.pickerStackParams(title: "Style", closeText: "Select")
    stylePicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(stylePicker, into: view)
  }
  
  func addLifestyleTimePickerStack() {
    let params = Default.pickerStackParams(title: "Lifestyle", closeText: "Select")
    lifestylePicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(lifestylePicker, into: view)
  }
  
  func finalViewSetup() {
    statusBar.sizeToFit()
    scrollView.sizeToFit()
    actionsStack.sizeToFit()
  }
  
}
