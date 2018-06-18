//
//  IngredientUtil.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class IngredientUtil {

  class func groupByGroup(_ ingredients: List<Ingredient>) -> [String: [Ingredient]] {
    return ingredients.categorise{$0.group}
  }
  
}

