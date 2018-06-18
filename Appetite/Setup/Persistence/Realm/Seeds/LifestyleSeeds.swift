//
//  LifestyleSeeds.swift
//  Appetite
//
//  Created by Adrian on 11/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class LifestyleSeeds {

  class func all() -> [(
    name: String,
    name_locale: String,
    info: String,
    locale: String,
    order: String,
    version: String,
    position: Int,
    isActive:Bool,
    isDeleted: Bool
    )]{

    var seeds:[(
      name: String,
      name_locale: String,
      info: String,
      locale: String,
      version: String,
      order: String,
      position: Int,
      isActive:Bool,
      isDeleted: Bool
      )] = []

     seeds.append(("Ancestral",                 "Ancestral",                "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Clean",                     "Clean",                    "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Gluten-Free",               "Gluten-Free",              "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Kosher",                    "Kosher",                   "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Lacto Vegetarian",          "Lacto Vegetarian",         "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Lacto Ovo Vegetarian",      "Lacto Ovo Vegetarian",     "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Mediterranean",             "Mediterranean",            "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Omnivore",                  "Omnivore",                 "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Ovo Vegetarian",            "Ovo Vegetarian",           "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Paleo",                     "Paleo",                    "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Pescetarian",               "Pescetarian",              "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Primal",                    "Primal",                   "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Raw Vegan",                 "Raw Vegan",                "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Traditional",               "Traditional",              "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Vegan",                     "Vegan",                    "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     seeds.append(("Vegetarian",                "Vegetarian",               "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
     return seeds
   }
}
