//
//  SchemaVersion.swift
//  Appetite
//
//  Created by Adrian on 11/25/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class SchemaVersion: Object {
    
  dynamic var id = ""
  dynamic var version = ""
  dynamic var created = Date()
  
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
