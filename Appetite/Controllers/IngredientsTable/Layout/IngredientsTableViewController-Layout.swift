//
//  IngredientsTableViewController-Layout.swift
//  Appetite
//
//  Created by Adrian on 12/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

extension IngredientsTableViewController {

  func layout(){
    configView()
    addStatusBar()
    addTableView()
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
  
  func addTableView() {
    let params = Default.scrollViewParams()
    tableView = ControlsFactory.buildTableView(params)
    view.addSubview(tableView)
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    tableView.topAnchor.constraint(equalTo: statusBar.bottomAnchor, constant: UX.Measurement.spacing.cgFloat).isActive = true
    //tableView.bottomAnchor.constraint(equalTo: self.bottomLayoutGuide.bottomAnchor).isActive = true
  }
  
  func addActionsStack() {
    let params = Default.segueButtonParams(title: "Paste List")
    pasteListButton = ControlsFactory.buildButton(params)
    params.title = "Add"
    addIngredientButton = ControlsFactory.buildButton(params)
    actionsStack = ControlsFactory.arranged2(pasteListButton, addIngredientButton)
    view.addSubview(actionsStack)
    actionsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UX.Measurement.mainLeadingMargin.cgFloat).isActive = true
    actionsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(UX.Measurement.mainTrailingMargin.cgFloat)).isActive = true
    actionsStack.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: UX.Measurement.spacing.cgFloat).isActive = true
    let tabBarHeight = tabBarSize().height
    actionsStack.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor, constant: -(tabBarHeight + 10)).isActive = true
  }
  
  func finalViewSetup() {
    statusBar.sizeToFit()
    tableView.sizeToFit()
    actionsStack.sizeToFit()
  }
  
}
