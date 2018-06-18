//
//  Mapper.swift
//  Appetite
//
//  Created by Adrian on 11/24/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import RealmSwift

class Mapper {

  class func extractNames(units: Results<Unit>) -> [String] {
    return units.map({$0.name})
  }
  
  class func extractNames(classifications: Results<Classification>) -> [String] {
    return classifications.map({$0.name})
  }

}
