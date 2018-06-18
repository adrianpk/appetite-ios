//
//  EditIngredientViewController-Status.swift
//  Appetite
//
//  Created by Adrian on 12/6/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension EditIngredientViewController {

  func processStatus() {
    if self.status.count > 0 {
      self.statusBar.setStatus(self.status)
    }
  }

}
