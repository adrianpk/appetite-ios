//
//  Recipe.swift
//  Appetite
//
//  Created by Adrian on 11/12/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class Recipe: Object {
  
  dynamic var id = ""
  dynamic var cookbook = ""
  dynamic var name = ""
  dynamic var canonicalName = ""
  dynamic var info = ""
  dynamic var yieldValue: Double = 0.0
  dynamic var yieldUnit: Unit?
  dynamic var yieldUnitName = ""
  dynamic var multiplierIndex: Double = M_E
  dynamic var preparationTimeHours: Int = 0
  dynamic var preparationTimeMinutes: Int = 0
  dynamic var preparationTimeSeconds: Int = 0
  dynamic var cookingTimeHours: Int = 0
  dynamic var cookingTimeMinutes: Int = 0
  dynamic var cookingTimeSeconds: Int = 0
  let ingredients = List<Ingredient>()
  //let directions = List<Direction>()
  //  dynamic var image: Image?
  //  var picture: UIImage? {
  //    get {
  //      if let _ = self.image {
  //        return self.image!.image
  //      } else {
  //        return nil
  //      }
  //    }
  //    set(newPicture){
  //      self.updateImage(newPicture!)
  //      self.picturePresent = true
  //    }
  //  }
  dynamic var picturePresent: Bool = false
  dynamic var thumbnailData: Data = Data()
  //  var thumbnail: UIImage? {
  //    get {
  //      return UIImage(data: thumbnailData)
  //    }
  //    set(newThumbnail){
  //      self.thumbnailData = UIImageJPEGRepresentation(newThumbnail!, CGFloat(1))!
  //      self.thumbnaillPresent = true
  //    }
  //  }
  dynamic var thumbnaillPresent: Bool = false
  dynamic var author = "" // Author of recipe
  dynamic var source = ""
  dynamic var sourceURL = ""
  dynamic var notes = ""
  dynamic var category: Classification?
  dynamic var categoryName = ""
  dynamic var cuisine: Classification?
  dynamic var cuisineName = ""
  dynamic var style: Classification?
  dynamic var styleName = ""
  dynamic var lifestyle: Classification?
  dynamic var lifestyleName = ""
  //let tags = List<Tag>()
  //let properties = List<Property>()
  dynamic var postedBy = "" // Posted first by User
  dynamic var gotFrom = "" // Got from User
  dynamic var isLoved: Bool = false
  dynamic var isPrivate: Bool = true
  dynamic var visibilityScope = "" // Me, Friends, Public
  dynamic var locale = ""
  dynamic var order = ""
  dynamic var position: Int = 0
  dynamic var isActive = true
  dynamic var isDeleted = false
  dynamic var created: Date?
  dynamic var updated: Date?
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  func generateId(){
    self.id = RealmEntity.generateId()
  }
  
  override static func ignoredProperties() -> [String] {
    return ["multiplier", "picture", "thumbnail", "categoryName", "cuisineName", "styleName", "lifestyleName"]
  }
  
  func defaultsForCreate() {
    self.setActiveState()
    self.setLogicalDelete()
    setAudit()
  }
  
  func setActiveState(_ isActive: Bool = true) {
    self.isActive = isActive
  }
  
  func setLogicalDelete(_ isDeleted: Bool = false) {
    self.isDeleted = isDeleted
  }
  
  func setAudit() {
    let now = Date()
    self.updated = now
    guard let _ = self.created else {
      self.created = now
      return
    }
  }
  
  func lovedIndicator() -> String? {
    switch (self.isLoved) {
      case true: return "❤️"
      default: return "💛"
    }
  }

  func toogleLovedStatus(){
    self.isLoved = !self.isLoved
  }
  
  func getMultiplier() -> Double {
    return Recipe.indexToMultiplierValue(self.multiplierIndex)
  }
  
  func setMultiplier(multiplier: Double) {
    self.multiplierIndex = Recipe.multiplierValueToIndex(multiplier)
  }

  func formattedPreparationTime() -> String? {
     return Recipe.formattedTime(h: self.preparationTimeHours, m: self.preparationTimeMinutes)
  }
  
  func formattedCookingTime() -> String? {
    return Recipe.formattedTime(h: self.cookingTimeHours, m: self.cookingTimeMinutes)
  }

  func formattedTotalTime() -> String? {
    let total = self.calculatedTotalTime()
    return Recipe.formattedTime(h: total.h, m: total.m)
  }
  
  class func zeroFormattedTime() -> String {
    return Recipe.formattedTime(h: 0, m: 0)
  }
  
  class func formattedTime(h: Int, m: Int) -> String {
    return "\(h)h \(m)'"
  }
  
  func calculatedTotalTime() -> (h: Int, m: Int){
    let preparationTime = (h: self.preparationTimeHours, m: self.preparationTimeMinutes, s: self.preparationTimeSeconds)
    let cookingTime = (h: self.preparationTimeHours, m: self.preparationTimeMinutes, s: self.preparationTimeSeconds)
    return Recipe.calculateTotalTime(preparationTime: preparationTime, cookingTime: cookingTime)
  }
  
//  func categoryName() -> String? {
//    if let category = self.category {
//      return category.name
//    }
//    return "n/a"
//  }
//
//  func cuisineName() -> String? {
//    if let cuisine = self.cuisine {
//      return cuisine.name
//    }
//    return "n/a"
//  }
//
//  func styleName() -> String? {
//    if let style = self.style {
//      return syle.name
//    }
//    return "n/a"
//  }
//
//  func lifestyleName() -> String? {
//    if let category = self.category {
//      return category.name
//    }
//    return "n/a"
//  }
//
//  class func propertyName<T>(property: T) -> String? {
//    if let prop = property {
//      return prop.name
//    }
//    return "n/a"
//  }
  
  // Misc
  class func indexToMultiplierValue(_ index: Double) -> Double {
     return log(index)
  }
  
  class func multiplierValueToIndex(_ multiplier: Double) -> Double {
    return Double(pow(M_E, multiplier))
  }
  
  class func calculateTotalTime(preparationTime: (h: Int, m: Int, s: Int), cookingTime: (h: Int, m: Int, s: Int)) -> (h: Int, m: Int){
    var minutes = preparationTime.h * 60
    minutes += preparationTime.m
    minutes += cookingTime.h * 60
    minutes += cookingTime.m
    let totalHours: Int = minutes / 60
    let leftMinutes = minutes % 60
    let result = (h: totalHours, m: leftMinutes)
    return result
  }

}
