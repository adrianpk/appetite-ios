//
//  RealmFinder.swift
//  Appetite
//
//  Created by Adrian on 11/21/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import RealmSwift

class RealmFinder: RealmPersistence {

  class func predicateWithActiveFilter(_ predicateString: String, includeInactive: Bool) -> String {
    if includeInactive {
      return predicateString
    } else {
      return predicateString + "and isActive == true"
    }
  }
  
}
