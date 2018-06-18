//
//  Classification.swift
//  Appetite
//
//  Created by Adrian on 11/24/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class Classification: Object {
    
  dynamic var id = ""
  dynamic var type = ""
  dynamic var name = ""
  dynamic var name_locale = ""
  dynamic var info = ""
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
