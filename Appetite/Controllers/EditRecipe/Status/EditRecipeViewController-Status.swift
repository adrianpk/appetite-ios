//
//  EditRecipeViewController-Status.swift
//  Appetite
//
//  Created by Adrian on 12/19/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import Foundation

extension EditRecipeViewController {

  func processStatus() {
    if self.status.count > 0 {
      self.statusBar.setStatus(self.status)
    }
  }
  
}
