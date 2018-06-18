//
//  RealmEntity.swift
//  Appetite
//
//  Created by Adrian on 11/22/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class RealmEntity {
    
  class func generateId() -> String{
    return UUID().uuidString
  }

}
