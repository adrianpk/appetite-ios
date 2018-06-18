//
//  Name.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class Name {
    
  enum Controller {
    case x
    
    private static let values: [Controller: String] = [
      x: ""
    ]
    
    var value: String {
      return Controller.values[self]!;
    }
  }
  
  enum Segue {
    case showIngredientsTable
    case showAddIngredient
    case showEditIngredient
    case showDirectionsTable
    case showAddDirection

    fileprivate static let values: [Segue: String] = [
      showIngredientsTable: "showIngredientsTable",
      showAddIngredient: "showAddIngredient",
      showEditIngredient: "showEditIngredient",
      showDirectionsTable: "showDirectionsTable",
      showAddDirection: "showAddDirection"
    ]
    
    var value: String {
      return Segue.values[self]!;
    }
  }
  
  enum Model {
    case x
    
    private static let values: [Model: String] = [
      x: ""
    ]
    
    var value: String {
      return Model.values[self]!;
    }
  }
  
  enum Property {
    case group
    
    private static let values: [Property: String] = [
      group: "group"
    ]
    
    var value: String {
      return Property.values[self]!;
    }
  }
}
