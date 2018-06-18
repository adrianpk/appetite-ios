//
//  IngredientsTableViewController.swift
//  Appetite
//
//  Created by Adrian on 11/29/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

class IngredientsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, RecipeControllerDelegate, TableViewCellDelegate {

  var statusBar: StatusBar!
  var tableView: UITableView!
  // Validations
  var status: [Status] = []
  // Model and View
  var recipe: Recipe?
  var selectedIngredient: Ingredient?
  var delegate: RecipeControllerDelegate?
  var ingredients: [String: [Ingredient]] = [:]
  var sections: [String] = []
  // Segues and Actions
  var actionsStack: Stack!
  var pasteListButton: Button!
  var addIngredientButton: Button!
  // Table
  let cellIdentifier = "cell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.layout()
    self.addGestureRecognizers()
    self.setupTable()
    self.navigationItem.rightBarButtonItem = self.editButtonItem
    // MARK: - Mock Data (delete on production)
    // MARK: - Update form
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.handleDelegate()
    self.currentIngredients()
    self.sectionsFromGroups()
    self.tableView.reloadData()	
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: - Table view data source
  func setupTable() {
    tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    //self.view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionName = self.sections[section]
    let sectionIngredients = self.ingredients[sectionName]
    return sectionIngredients!.count
  }


  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sectionName = self.sections[indexPath.section]
    let sectionIngredients = self.ingredients[sectionName]!
    let ingredient =  sectionIngredients[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! IngredientTableViewCell
    return self.updatedCell(cell, ingredient: ingredient)
  }
  
  func updatedCell(_ cell: IngredientTableViewCell, ingredient: Ingredient) -> IngredientTableViewCell {
    cell.elementId = ingredient.id
    cell.quantity.text = "\(ingredient.quantity)"
    cell.unit.text = ingredient.quantityUnitName
    cell.name.text = ingredient.name
    let color = View.cellColors(ingredient.isOptional, emphasized: UX.Palette.cellBackground.uicolor, deEmphasizedColor: UX.Palette.cellBackgroundDeemphasized.uicolor)
    cell.backgroundColor = color.background
    cell.quantity.textColor = color.font
    cell.unit.textColor = color.font
    cell.name.textColor = color.font
    cell.delegate = self
    return cell
  }

  /*
  // Override to support conditional editing of the table view.
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  */


  // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        // Delete the row from the data source
        tableView.deleteRows(at: [indexPath], with: .fade)
    } else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let sectionName = self.sections[indexPath.section]
    let sectionIngredients = self.ingredients[sectionName]!
    self.selectedIngredient =  sectionIngredients[indexPath.row]
    self.performSegue(withIdentifier: Name.Segue.showEditIngredient.value, sender: self)
  }

  /*
  // Override to support rearranging the table view.
  override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

  }
  */

  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
  }
  */

  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Name.Segue.showAddIngredient.value {
      if let vc = segue.destination as? EditIngredientViewController {
        self.selectedIngredient = nil
        vc.delegate = self
      }
    } else if segue.identifier == Name.Segue.showEditIngredient.value {
      if let vc = segue.destination as? EditIngredientViewController {
        vc.delegate = self
      }
    }
  }

  // MARK: - Delegate related
  func handleDelegate() {
    self.recipe = self.delegate!.getRecipe()
    self.processStatus()
  }
  
  internal func getRecipe() -> Recipe {
    return self.recipe!
  }
  
  internal func getSelectedIngredient() -> Ingredient? {
    return self.selectedIngredient
  }

  
  internal func setStatus(status: [Status]) {
    self.status = status
  }
  
  internal func getStatus() -> [Status] {
    return self.status
  }
  
  internal func completed(recipe: Recipe) {
    //
  }
  
  // MARK: - Ingredients
  func currentIngredients() {
    self.ingredients = IngredientUtil.groupByGroup((self.recipe?.ingredients)!)
    print()
  }
  
  func sectionsFromGroups() {
    self.sections = Array(self.ingredients.keys)
  }
  
  internal func touchUpInside(id: String) {
    performSegue(withIdentifier: Name.Segue.showEditIngredient.value, sender: self)
  }

  func showAddIngredient(_ sender: Any) {
    let viewController = EditIngredientViewController()
    viewController.delegate = self
    self.navigationController?.pushViewController(viewController, animated: true)
  }
  
  func showPasteList(_ sender: Any) {
//    let viewController = EditIngredientViewController()
//    viewController.delegate = self
//    self.navigationController?.pushViewController(viewController, animated: true)
  }
  

}
