//
//  IngredientSeed.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation

class IngredientSeed {



  class func all() -> [(
    group: String,
    name: String,
    canonicalName: String,
    info: String,
    quantity: Double,
    unit: Unit,
    isOptional: Bool,
    notes: String,
    usdaIngredient: String,
    locale: String,
    order: String,
    position: Int,
    isActive: Bool,
    isDeleted: Bool
    )]{

      let en_US_locale = I18N.Locale.en_US.value
      let gramUnit = UnitFinder.find(name: "gram")!
      let cm3Unit = UnitFinder.find(name: "cubic centimeter")!
      let unitUnit = UnitFinder.find(name: "unit")!
    
      var seeds:[(
        group: String,
        name: String,
        canonicalName: String,
        info: String,
        quantity: Double,
        unit: Unit,
        isOptional: Bool,
        notes: String,
        usdaIngredient: String,
        locale: String,
        order: String,
        position: Int,
        isActive: Bool,
        isDeleted: Bool
      )] = []

      seeds.append(("Dough", "flour", "flour", "", 100, gramUnit, false, "", "", en_US_locale, "", 0, true, false))
      seeds.append(("Dough", "water", "water", "", 125, cm3Unit, false, "", "", en_US_locale, "", 1, true, false))
      
      seeds.append(("Filling", "spinach", "spinach", "", 250, gramUnit, false, "", "", en_US_locale, "", 2, true, false))
      seeds.append(("Filling", "egg", "egg", "", 2, unitUnit, false, "", "", en_US_locale, "", 3, true, false))
      return seeds
  }

}
