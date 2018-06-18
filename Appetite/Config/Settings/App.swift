//
//  App.swift
//  Appetite
//
//  Created by Adrian on 11/25/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class App {
    
  enum Config {
    case appVersion
    case dataVersion
    
    fileprivate static let values: [Config: String] = [
      appVersion: "20161125000000",
      dataVersion: "20161125000000",
    ]
    
    var value: String {
      return Config.values[self]!
    }
  }
  
  enum ClassificationType {
    case category
    case cuisine
    case style
    case lifestyle
    
    private static let values: [ClassificationType: String] = [
        category: "Category",
        cuisine: "Cuisine",
        style: "Style",
        lifestyle: "Lifestyle",
      ]
    
    var value: String {
      return ClassificationType.values[self]!;
    }
  }
  
  enum Classification {
    case category
    case cuisine
    case style
    case lifestyle
    
    private static let values: [Classification: String] = [
      category: "Category",
      cuisine: "Cuisine",
      style: "Style",
      lifestyle: "Lifestyle",
      ]
    
    var value: String {
      return Classification.values[self]!;
    }
  }

}
