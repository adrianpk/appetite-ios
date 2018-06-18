//
//  UnitManager.swift
//  Appetite
//
//  Created by Adrian on 11/21/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class UnitManager: RealmManager {
  
  class func create(persist: Bool = false) -> Unit {
    let entity = Unit()
    entity.generateId()
    if persist {
      let realm = defaultRealm()
      try! realm.write {
        realm.add(entity)
      }
    }
    return entity
  }

  class func setupMock() -> Unit {
    let realm = defaultRealm()
    let unit = realm.objects(Unit.self).filter("name == 'Unit'").first
    guard let _ = unit else {
      realm.beginWrite()
      let newUnit = Unit()
      newUnit.generateId()
      newUnit.name = "Unit"
      newUnit.abbreviation = "Unit"
      newUnit.info = ""
      newUnit.type = ""
      newUnit.system = ""
      newUnit.isPrecise = true
      newUnit.order = ""
      newUnit.position = 0
      newUnit.isActive = true
      newUnit.isDeleted = false
      newUnit.created = Date()
      newUnit.updated = Date()
      realm.add(newUnit)
      try! realm.commitWrite()
      return newUnit
    }
    return unit!
  }
  
}
