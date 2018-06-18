//
//  SchemaVersionManager.swift
//  Appetite
//
//  Created by Adrian on 11/25/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class SchemaVersionManager: RealmManager {
    
  class func create(persist: Bool = false) -> SchemaVersion {
    let entity = SchemaVersion()
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
