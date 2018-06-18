//
//  IngredientManager.swift
//  Appetite
//
//  Created by Adrian on 12/3/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class IngredientManager: RealmManager {

  class func create(persist: Bool = false) -> Ingredient {
    let entity = Ingredient()
    entity.generateId()
    if persist {
      let realm = defaultRealm()
      try! realm.write {
        realm.add(entity)
      }
    }
    return entity
  }
  
}
