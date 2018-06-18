//
//  I18N_Text_en_US.swift
//  Appetite
//
//  Created by Adrian on 12/3/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension I18N {

  enum Text {
    case unit
    case preparation
    case cooking
    case category
    case cuisine
    case style
    case lifestyle

    fileprivate static let en_US_values: [Text: String] = [
      unit: "Unit",
      preparation: "Preparation",
      cooking: "Cooking",
      category: "Category",
      cuisine: "Cuisine",
      style: "Style",
      lifestyle: "Lifestyle"
    ]

    var value: String {
      return Text.en_US_values[self]!
    }
  }
  
  enum Message {
    case quantity_empty_error
    case name_empty_error

    
    fileprivate static let en_US_values: [Message: String] = [
      quantity_empty_error: "Quantity cannot be empty.",
      name_empty_error: "Name cannot be empty."
    ]
    
    var value: String {
      return Message.en_US_values[self]!
    }
  }

}
