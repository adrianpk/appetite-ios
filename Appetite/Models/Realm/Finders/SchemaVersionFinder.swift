//
//  SchemaVersionFinder.swift
//  Appetite
//
//  Created by Adrian on 11/25/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class SchemaVersionFinder: RealmFinder {
    
  class func find(id: AnyObject) -> SchemaVersion? {
    let realm = defaultRealm()
    return realm.object(ofType: SchemaVersion.self, forPrimaryKey: id)
  }

  class func all() -> Results<SchemaVersion> {
    let realm = defaultRealm()
    return realm.objects(SchemaVersion.self).sorted(byProperty: "created", ascending: true)
  }
  
  class func last() -> SchemaVersion? {
    let realm = defaultRealm()
    return realm.objects(SchemaVersion.self).sorted(byProperty: "created", ascending: false).first
  }

}
