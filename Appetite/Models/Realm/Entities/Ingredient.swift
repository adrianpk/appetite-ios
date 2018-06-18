//
//  Ingredient.swift
//  Appetite
//
//  Created by Adrian on 11/30/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation
import RealmSwift

class Ingredient: Object {
  
  dynamic var id = ""
  dynamic var group = ""
  dynamic var name = ""
  dynamic var canonicalName = ""
  dynamic var info = ""
  dynamic var quantity: Double = 0.0
  dynamic var quantityUnit: Unit?
  dynamic var quantityUnitName = ""
  dynamic var isOptional: Bool = false
  dynamic var notes = ""
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
  dynamic var usdaIngredient = ""
  let recipe = LinkingObjects(fromType: Recipe.self, property: "ingredients")
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
    return ["picture", "thumbnail"]
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

  func optionalIndicator() -> String? {
    switch (self.isOptional) {
      case true: return "✅"
      default: return "☑️"
    }
  }

}
