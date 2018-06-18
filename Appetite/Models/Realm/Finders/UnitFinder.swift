//
//  UnitFinder.swift
//  Appetite
//
//  Created by Adrian on 11/21/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class UnitFinder: RealmFinder {
    
  class func find(id: AnyObject) -> Unit? {
    let realm = defaultRealm()
    return realm.object(ofType: Unit.self, forPrimaryKey: id)
  }
  
  class func find(name: String) -> Unit? {
    let realm = defaultRealm()
    let predicate = NSPredicate(format: "name = %@", name)
    return realm.objects(Unit.self).filter(predicate).first
  }
  
  class func all(_ includeInactive: Bool = false) -> Results<Unit> {
    let realm = defaultRealm()
    let predicate = NSPredicate(format: "isActive != %@", includeInactive as CVarArg)
    return realm.objects(Unit.self).filter(predicate)
  }
  
}
