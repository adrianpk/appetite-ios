//
//  RecipeFinder.swift
//  Appetite
//
//  Created by Adrian on 11/21/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class RecipeFinder: RealmFinder {
    

  class func find(id: AnyObject) -> Recipe? {
    let realm = defaultRealm()
    return realm.object(ofType: Recipe.self, forPrimaryKey: id)
  }
  
  class func find(name: String) -> Recipe? {
    let realm = defaultRealm()
    let predicate = NSPredicate(format: "name = %@", name)
    return realm.objects(Recipe.self).filter(predicate).first
  }
  
}
