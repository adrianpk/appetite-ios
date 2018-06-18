//
//  UnitSeeds.swift
//  Appetite
//
//  Created by Adrian on 11/22/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class UnitSeeds {

  class func all() -> [(
    name: String,
    name_locale: String,
    abbreviation: String,
    info: String,
    type: String,
    system: String,
    isPrecise: Bool,
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
      abbreviation: String,
      info: String,
      type: String,
      system: String,
      isPrecise: Bool,
      locale: String,
      version: String,
      order: String,
      position: Int,
      isActive:Bool,
      isDeleted: Bool
      )] = []

    seeds.append(("unit",             "unit",             "unit",         "",     "quantity",   "all",          true,       "en_US",      App.Config.dataVersion.value,     "count",                    0,      true,     false))
    seeds.append(("portion",          "portion",          "portion",      "",     "quantity",   "all",          true,       "en_US",      App.Config.dataVersion.value,     "count",                    1,      true,     false))
    seeds.append(("a pinch",          "a pinch",          "a pinch",      "",     "quantity",   "all",          false,      "en_US",      App.Config.dataVersion.value,     "imprecise",                2,      true,     false))
    seeds.append(("at ease",          "at ease",          "at ease",      "",     "quantity",   "all",          false,      "en_US",      App.Config.dataVersion.value,     "imprecise",                3,      true,     false))
    // U.S. customary - Volume                                                                                                                                                                                                  #
    seeds.append(("teaspoon",         "teaspoon",         "tsp",          "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      0,      true,     false))
    seeds.append(("tablespoon",       "tablespoon",       "tbs",          "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      1,      true,     false))
    seeds.append(("fluid ounce",      "fluid ounce",      "fl-oz",        "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      2,      true,     false))
    seeds.append(("gill",             "gill",             "gill",         "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      3,      true,     false))
    seeds.append(("cup",              "cup",              "c",            "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      4,      true,     false))
    seeds.append(("pint",             "pint",             "fl-pt",        "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      5,      true,     false))
    seeds.append(("quart",            "quart",            "fl-qt",        "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      6,      true,     false))
    seeds.append(("gallon",           "gallon",           "gal",          "",     "volume",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-volume",      7,      true,     false))
    // Metric - Volume                                                                                                                                                                                                          #
    seeds.append(("milliliter",       "milliliter",       "ml",           "",     "volume",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-volume",            8,      true,     false))
    seeds.append(("liter",            "liter",            "L",            "",     "volume",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-volume",            9,      true,     false))
    seeds.append(("deciliter",        "deciliter",        "dL",           "",     "volume",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-volume",            10,     true,     false))
    seeds.append(("cubic centimeter",  "cubic centimeter", "cm3",          "",     "volume",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-volume",            11,     true,     false))
    // U.S. customary - Weight                                                                                                                                                                                                  #                                                                                                                                                                              #
    seeds.append(("pound",            "pound",            "lb",           "",     "weight",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-weight",      0,      true,     false))
    seeds.append(("ounce",            "ounce",            "oz",           "",     "weight",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-weight",      1,      true,     false))
    // Metric - Weight                                                                                                                                                                                                          #
    seeds.append(("milligram",        "milligram",        "mg",           "",     "weight",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-weight",            2,      true,     false))
    seeds.append(("gram",             "gram",             "g",            "",     "weight",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-weight",            3,      true,     false))
    seeds.append(("kilogram",         "kilogram",         "kg",           "",     "weight",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-weight",            4,      true,     false))
    // U.S. customary - Length                                                                                                                                                                                                  #
    seeds.append(("inch",             "inch",             "in",           "",     "length",     "american",     true,       "en_US",      App.Config.dataVersion.value,     "us-customary-length",      0,      true,     false))
    // Metric - Length                                                                                                                                                                                                          #
    seeds.append(("milimeter",        "milimeter",        "mm",           "",     "length",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-length",            1,      true,     false))
    seeds.append(("centimeter",       "centimeter",       "cm",           "",     "length",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-length",            2,      true,     false))
    seeds.append(("meter",            "meter",            "m",            "",     "length",     "metric",       true,       "en_US",      App.Config.dataVersion.value,     "metric-length",            3,      true,     false))
    return seeds
  }
}
