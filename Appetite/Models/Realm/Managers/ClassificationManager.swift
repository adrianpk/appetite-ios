//
//  ClassificationManager.swift
//  Appetite
//
//  Created by Adrian on 11/24/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class ClassificationManager: RealmManager {
    
  class func create(persist: Bool = false) -> Classification {
    let entity = Classification()
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
