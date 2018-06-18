//
//  StyleSeeds.swift
//  Appetite
//
//  Created by Adrian on 11/23/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class StyleSeeds {

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

    seeds.append(("Classique",        "Classique",        "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Fast food",        "Fast food",        "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Fusion",           "Fusion",           "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Haute",            "Haute",            "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Molecular",        "Molecular",        "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Note by Note",     "Note by Note",     "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    seeds.append(("Nouvelle",         "Nouvelle",         "",     "en_US",      App.Config.dataVersion.value,     "",     0,      true,     false))
    return seeds
  }
}
