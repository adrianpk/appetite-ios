//
//  RecipeManager.swift
//  Appetite
//
//  Created by Adrian on 11/16/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class RecipeManager: RealmManager {
    
  class func create(persist: Bool = false) -> Recipe {
    let entity = Recipe()
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
