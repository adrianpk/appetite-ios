//
//  RealmSeeder.swift
//  Appetite
//
//  Created by Adrian on 11/22/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class RealmSeeder {

  class func start() {
    printRealmPath()
    populateDatabase()
  }

  class func populateDatabase(){
    self.populateSchemaVersion()
    self.populateUnit()
    self.populateCategory()
    self.populateCuisine()
    self.populateStyle()
    self.populateLifestyle()
    // Samples
    self.populateSampleIngredients()
    self.populateSampleRecipes()

  }

  class func printRealmPath() {
    print("Realm database file location: \(Realm.Configuration.defaultConfiguration.fileURL)")
  }


  class func needToPopulate(object: Object.Type) -> Bool {
    let realm = RealmPersistence.defaultRealm()
    let objects = realm.objects(object)
    return objects.count == 0
  }

  class func needToPopulate(type: String) -> Bool {
    let realm = RealmPersistence.defaultRealm()
    let predicate = NSPredicate(format: "type = %@", type)
    let objects = realm.objects(Classification.self).filter(predicate)
    return objects.count == 0
  }

  // Units
  class func populateSchemaVersion() {
    let realm = RealmPersistence.defaultRealm()
    try! realm.write {
      let schema_version = SchemaVersion()
      schema_version.generateId()
      schema_version.version = App.Config.appVersion.value
      schema_version.created = Date()
      realm.add(schema_version)
    }

  }

  // Units
  class func populateUnit() {
    if needToPopulate(object: Unit.self) {
      let realm = RealmPersistence.defaultRealm()
      try! realm.write {
        for seed in UnitSeeds.all() {
          let unit = Unit()
          unit.generateId()
          unit.name = seed.name
          unit.name_locale = seed.name_locale
          unit.abbreviation = seed.abbreviation
          unit.info = seed.info
          unit.type = seed.type
          unit.system = seed.system
          unit.isPrecise = seed.isPrecise
          unit.version = seed.version
          unit.locale = seed.locale
          unit.order = seed.order
          unit.position = seed.position
          unit.isActive = seed.isActive
          realm.add(unit)
        }
      }
    }
  }

  class func populateCategory() {
    populateClassification(type: App.ClassificationType.category.value, seeds: CategorySeeds.all())
  }

  class func populateCuisine() {
    populateClassification(type: App.ClassificationType.cuisine.value, seeds: CuisineSeeds.all())
  }

  class func populateStyle() {
    populateClassification(type: App.ClassificationType.style.value, seeds: StyleSeeds.all())
  }

  class func populateLifestyle() {
    populateClassification(type: App.ClassificationType.lifestyle.value, seeds: LifestyleSeeds.all())
  }

  class func populateClassification(type: String, seeds:[(name: String,
                                                           name_locale: String,
                                                           info: String,
                                                           locale: String,
                                                           version: String,
                                                           order: String,
                                                           position: Int,
                                                           isActive:Bool,
                                                           isDeleted: Bool
                                                         )]) {
    if needToPopulate(type: type) {
      let realm = RealmPersistence.defaultRealm()
      try! realm.write {
        for seed in seeds {
          realm.add(populateClassification(Classification(), seed: seed, type:type))
        }
      }
    }
  }

  class func populateClassification(_ classification: Classification, seed: (name: String,
                                                                             name_locale: String,
                                                                             info: String,
                                                                             locale: String,
                                                                             version: String,
                                                                             order: String,
                                                                             position: Int,
                                                                             isActive:Bool,
                                                                             isDeleted: Bool
                                                                            ),
                                                                      type: String) -> Classification {
    classification.generateId()
    classification.type = type
    classification.name = seed.name
    classification.name_locale = seed.name_locale
    classification.info = seed.info
    classification.locale = seed.locale
    classification.version = seed.version
    classification.order = seed.order
    classification.position = seed.position
    classification.isActive = seed.isActive
    return classification
  }

  // Sample Ingredient
  class func populateSampleIngredients() {
    if needToPopulate(object: Ingredient.self) {
      let realm = RealmPersistence.defaultRealm()
      try! realm.write {
        for seed in IngredientSeed.all() {
          let ingredient = Ingredient()
          ingredient.generateId()
          ingredient.group = seed.group
          ingredient.name = seed.name
          ingredient.canonicalName = seed.canonicalName
          ingredient.info = seed.info
          ingredient.quantity = seed.quantity
          ingredient.quantityUnit = seed.unit
          ingredient.quantityUnitName = seed.unit.abbreviation
          ingredient.locale = seed.locale
          ingredient.order = seed.order
          ingredient.position = seed.position
          ingredient.isActive = seed.isActive
          ingredient.isDeleted = seed.isDeleted
          realm.add(ingredient)
        }
      }
    }
  }


  // Sample Recipe
  class func populateSampleRecipes() {
    if needToPopulate(object: Recipe.self) {
      let realm = RealmPersistence.defaultRealm()
      try! realm.write {
        for seed in RecipeSeeds.all() {
          let recipe = Recipe()
          recipe.generateId()
          recipe.cookbook = seed.cookbook
          recipe.name = seed.name
          recipe.canonicalName = seed.canonicalName
          recipe.info = seed.info
          recipe.yieldValue = seed.yieldValue
          recipe.yieldUnit = seed.yieldUnit
          recipe.yieldUnitName = seed.yieldUnit.name
          recipe.multiplierIndex = seed.multiplierIndex
          recipe.preparationTimeHours = seed.preparationTimeHours
          recipe.preparationTimeMinutes = seed.preparationTimeMinutes
          recipe.preparationTimeSeconds = seed.preparationTimeSeconds
          recipe.cookingTimeHours = seed.cookingTimeHours
          recipe.cookingTimeMinutes = seed.cookingTimeMinutes
          recipe.cookingTimeSeconds = seed.cookingTimeSeconds
          recipe.ingredients.append(objectsIn: seed.ingredients)
          recipe.author = seed.author
          recipe.source = seed.source
          recipe.sourceURL = seed.sourceURL
          recipe.notes = seed.notes
          recipe.category = seed.category
          recipe.categoryName = seed.category.name
          recipe.cuisine = seed.cuisine
          recipe.cuisineName = seed.cuisine.name
          recipe.style = seed.style
          recipe.styleName = seed.style.name
          recipe.lifestyle = seed.lifestyle
          recipe.lifestyleName = seed.lifestyle.name
          recipe.isLoved = seed.isLoved
          recipe.isPrivate = seed.isPrivate
          recipe.visibilityScope = seed.visibilityScope
          recipe.locale = seed.locale
          recipe.order = seed.order
          recipe.position = seed.position
          recipe.isActive = seed.isActive
          recipe.isDeleted = seed.isDeleted
          realm.add(recipe)
        }
      }
    }
  }

}
