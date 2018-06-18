//
//  ClassificationFinder.swift
//  Appetite
//
//  Created by Adrian on 11/24/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class ClassificationFinder: RealmFinder {
    
  class func find(id: AnyObject) -> Classification? {
    let realm = defaultRealm()
    return realm.object(ofType: Classification.self, forPrimaryKey: id)
  }
  
  class func find(byType: String, name: String, includeInactive: Bool = false) -> Classification? {
    let realm = defaultRealm()
    let predicateString = super.predicateWithActiveFilter("type = %@ and name = %@", includeInactive: includeInactive)
    let predicate = NSPredicate(format: predicateString, byType, name)
    return realm.objects(Classification.self).filter(predicate).first
  }
  
  class func all(ofType: String, includeInactive: Bool = false) -> Results<Classification> {
    let realm = defaultRealm()
    let predicateString = super.predicateWithActiveFilter("type = %@", includeInactive: includeInactive)
    let predicate = NSPredicate(format: predicateString, ofType)
    return realm.objects(Classification.self).filter(predicate)
  }
  


}
