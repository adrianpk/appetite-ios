//
//  CategorySeed.swift
//  Appetite
//
//  Created by Adrian on 11/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class CategorySeeds {

  class func all() -> [(
    name: String,
    name_locale: String,
    info: String,
    locale: String,
    version: String,
    order: String,
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

    seeds.append(("Breakfast",        "Breakfast",        "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Brunch",           "Brunch",           "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Elevenses",        "Elevenses",        "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Salad",            "Salad",            "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Entrée",           "Entrée",           "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Entremet",         "Entremet",         "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Main course",      "Main course",      "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Lunch",            "Lunch",            "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Tea",              "Tea",              "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Snack",            "Snack",            "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Soup",             "Soup",             "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Dinner",           "Dinner",           "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Supper",           "Supper",           "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Side dish",        "Side dish",        "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Dessert",          "Dessert",          "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    return seeds
  }
}
