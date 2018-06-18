//
//  I18N.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class I18N {

  enum Locale {
    case en_US
    
    fileprivate static let values: [Locale: String] = [
      en_US: "en_US",
    ]
    
    var value: String {
      return Locale.values[self]!
    }
  }
  
}
