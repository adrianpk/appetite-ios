//
//  EditIngredientViewController-Layout.swift
//  Appetite
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

extension EditIngredientViewController {
  
  func layout(){
    configView()
    addStatusBar()
    addScrollView()
    addMainStack()
    addGroupStack()
    addQuantityStack()
    addIngredientStack()
    addPickerStacks()
    addActionsStack()
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
  
  func addGroupStack() {
    let params = Default.textFieldStackParams(title: "Group", placeholder: "E.g. dough, filling, frosting, decoration, etc.")
    groupTextField = ControlsFactory.buildTextFieldStack(params)
    ControlsFactory.arrangeView(groupTextField, into: mainStack)
  }

  func addQuantityStack() {
    var params = Default.titleLabelParams(withText: "Quantity")
    let title = ControlsFactory.buildLabel(params)
    params = Default.textFieldParams(placeholder: "Qty.")
    quantityTextField = ControlsFactory.buildTextField(params)
    params = Default.selectorButtonParams(title: "Unit")
    quantityUnitButton = ControlsFactory.buildButton(params)
    let stack = ControlsFactory.arranged12(title, quantityTextField, quantityUnitButton)
    ControlsFactory.arrangeView(stack, into: mainStack)
  }
  
  func addIngredientStack() {
    var params = Default.titleLabelParams(withText: "Ingredient")
    let title = ControlsFactory.buildLabel(params)
    params = Default.textFieldParams()
    nameTextField = ControlsFactory.buildTextField(params)
    params = Default.switchStackParams(title: "Optional", titlePlacement: .right, isOn: false)
    isOptionalSwitch = ControlsFactory.buildSwitchStack(params)
    let stack = ControlsFactory.arranged12(title, nameTextField, isOptionalSwitch)
    ControlsFactory.arrangeView(stack, into: mainStack)
  }

  func addActionsStack() {
    let params = Default.actionButtonParams(title: "Save")
    saveButton = ControlsFactory.buildButton(params)
    actionsStack = ControlsFactory.arranged1(saveButton)
    view.addSubview(actionsStack)
    actionsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UX.Measurement.mainLeadingMargin.cgFloat).isActive = true
    actionsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(UX.Measurement.mainTrailingMargin.cgFloat)).isActive = true
    actionsStack.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: UX.Measurement.spacing.cgFloat).isActive = true
    let tabBarHeight = tabBarSize().height
    actionsStack.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: -(tabBarHeight + 10)).isActive = true
  }
  
  func addPickerStacks() {
    addQuantityUnitPickerStack()
  }
  
  func addQuantityUnitPickerStack() {
    let params = Default.pickerStackParams(title: "Unit", closeText: "Select")
    quantityUnitPicker = ControlsFactory.buildPickerStack(params)
    ControlsFactory.center(quantityUnitPicker, into: view)
  }

  func finalViewSetup() {
    statusBar.sizeToFit()
    scrollView.sizeToFit()
    actionsStack.sizeToFit()
  }
  
}
