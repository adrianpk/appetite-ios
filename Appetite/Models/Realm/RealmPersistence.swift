//
//  RealmPersistence.swift
//  Appetite
//
//  Created by Adrian on 11/21/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class RealmPersistence: Object {
    
  class func defaultRealm() -> Realm {
    return try! Realm()
  }
  
  func defaultRealm() -> Realm {
    return RealmPersistence.defaultRealm()
  }

}
