//
//  Unit.swift
//  Appetite
//
//  Created by Adrian on 11/21/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class Unit: Object {
    
  dynamic var id = ""
  dynamic var name = ""
  dynamic var name_locale = ""
  dynamic var abbreviation = ""
  dynamic var info = ""
  dynamic var type = ""
  dynamic var system = ""
  dynamic var isPrecise = Bool()
  dynamic var locale = ""
  dynamic var version = ""
  dynamic var order = ""
  dynamic var position: Int = 0
  dynamic var isActive = Bool()
  dynamic var isDeleted = Bool()
  dynamic var created = Date()
  dynamic var updated = Date()
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  func generateId(){
    self.id = RealmEntity.generateId()
  }
  
  override static func ignoredProperties() -> [String] {
    return []
  }

}
