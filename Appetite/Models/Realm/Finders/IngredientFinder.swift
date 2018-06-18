//
//  IngredientFinder.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import RealmSwift

class IngredientFinder: RealmFinder {

  class func find(id: AnyObject) -> Ingredient? {
    let realm = defaultRealm()
    return realm.object(ofType: Ingredient.self, forPrimaryKey: id)
  }
  
  class func find(name: String) -> Ingredient? {
    let realm = defaultRealm()
    let predicate = NSPredicate(format: "name = %@", name)
    return realm.objects(Ingredient.self).filter(predicate).first
  }
  
  class func all(_ includeInactive: Bool = false) -> Results<Ingredient> {
    let realm = defaultRealm()
    let predicate = NSPredicate(format: "isActive != %@", includeInactive as CVarArg)
    return realm.objects(Ingredient.self).filter(predicate)
  }
  
  
}
