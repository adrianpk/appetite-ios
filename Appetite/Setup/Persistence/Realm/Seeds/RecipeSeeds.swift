//
//  RecipeSeeds.swift
//  Appetite
//
//  Created by Adrian on 11/29/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class RecipeSeeds {
  
  class func all() -> [(
      cookbook: String,
      name: String,
      canonicalName: String,
      info: String,
      yieldValue: Double,
      yieldUnit: Unit,
      multiplierIndex: Double,
      preparationTimeHours: Int,
      preparationTimeMinutes: Int,
      preparationTimeSeconds: Int,
      cookingTimeHours: Int,
      cookingTimeMinutes: Int,
      cookingTimeSeconds: Int,
      ingredients: Results<Ingredient>,
      author: String,
      source: String,
      sourceURL: String,
      notes: String,
      category: Classification,
      cuisine: Classification,
      style: Classification,
      lifestyle: Classification,
      isLoved: Bool,
      isPrivate: Bool,
      visibilityScope: String,
      locale: String,
      order: String,
      position: Int,
      isActive: Bool,
    isDeleted: Bool
    )]{

      let en_US_locale = I18N.Locale.en_US.value
      let gramUnit = UnitFinder.find(name: "gram")!
      let lunchCategory = ClassificationFinder.find(byType: App.ClassificationType.category.value, name: "Lunch")!
      let italianCuisine = ClassificationFinder.find(byType: App.ClassificationType.cuisine.value, name: "Italian")!
      let classiqueStyle = ClassificationFinder.find(byType: App.ClassificationType.style.value, name: "Classique")!
      let traditionLifestyle = ClassificationFinder.find(byType: App.ClassificationType.lifestyle.value, name: "Traditional")!
      let ingredients = IngredientFinder.all()
//      let cm3Unit = UnitFinder.find(name: "cubic centimeter")!
//      let unitUnit = UnitFinder.find(name: "unit")!
//      let flourIngredient = IngredientFinder.find(name: "flour")!
//      let waterIngredient = IngredientFinder.find(name: "water")!
//      let spinachIngredient = IngredientFinder.find(name: "spinach")!
//      let eggIngredient = IngredientFinder.find(name: "egg")!
      
      var seeds:[(
        cookbook: String,
        name: String,
        canonicalName: String,
        info: String,
        yieldValue: Double,
        yieldUnit: Unit,
        multiplierIndex: Double,
        preparationTimeHours: Int,
        preparationTimeMinutes: Int,
        preparationTimeSeconds: Int,
        cookingTimeHours: Int,
        cookingTimeMinutes: Int,
        cookingTimeSeconds: Int,
        ingredients: Results<Ingredient>,
        author: String,
        source: String,
        sourceURL: String,
        notes: String,
        category: Classification,
        cuisine: Classification,
        style: Classification,
        lifestyle: Classification,
        isLoved: Bool,
        isPrivate: Bool,
        visibilityScope: String,
        locale: String,
        order: String,
        position: Int,
        isActive: Bool,
        isDeleted: Bool
      )] = []

      seeds.append(("Cookbook", "Lasagna", "lasagna", "Vera receta italiana", 750, gramUnit, 2.71, 1, 10, 0, 0, 30, 0, ingredients, "author", "source", "http://google.com", "Notes", lunchCategory, italianCuisine, classiqueStyle, traditionLifestyle, true, true, "me", en_US_locale, "", 0, true, false))
      return seeds
  }

}
