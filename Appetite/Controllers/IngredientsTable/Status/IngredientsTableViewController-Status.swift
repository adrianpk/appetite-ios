//
//  IngredientsTableViewController-Status.swift
//  Appetite
//
//  Created by Adrian on 12/16/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit
import Controls

extension IngredientsTableViewController {

  func processStatus() {
    if self.status.count > 0 {
      self.statusBar.setStatus(self.status)
    }
  }

}
