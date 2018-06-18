//
//  RealmManager.swift
//  Appetite
//
//  Created by Adrian on 11/15/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import RealmSwift

class RealmManager: RealmPersistence {

  class func save(_ model: Object, update: Bool = true) {
    let realm = defaultRealm()
    realm.beginWrite()
    realm.add(model, update: true)
    try! realm.commitWrite()
  }
  
  class func save(_ model: Object, update: Bool = true, updater: (() -> Void)? = nil) {
    let realm = defaultRealm()
    realm.beginWrite()
    if let objectUpdater = updater {
      objectUpdater()
    }
    realm.add(model, update: update)
    try! realm.commitWrite()
  }
  
  class func update(_ model: Object, persist: Bool = false, update: Bool = true, updater: (() -> Void)? = nil) {
    let realm = defaultRealm()
    realm.beginWrite()
    if let objectUpdater = updater {
      objectUpdater()
    }
    if persist {
      realm.add(model, update: update)
    }
    try! realm.commitWrite()
  }

}
