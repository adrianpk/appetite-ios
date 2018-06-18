//
//  Converter.swift
//  Appetite
//
//  Created by Adrian on 11/16/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class Converter {

  class func toInt(_ string: String, ifNilValue: Int = 0) -> Int {
    if let intValue = Int(string) {
      return intValue
    } else {
      return ifNilValue
    }
  }
  
  class func toDouble(_ string: String, ifNilValue: Double = 0.0) -> Double {
    if let doubleValue = Double(string) {
      return doubleValue
    } else {
      return ifNilValue
    }
  }

  

}
