//
//  EditRecipeViewController-Image.swift
//  Appetite
//
//  Created by Adrian on 11/18/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

extension EditRecipeViewController {

  func setupImageRelatedViews() {
    self.hideImageStack()
    self.hideDeleteImageButton()
  }
  
  func hideImageStack() {
    self.imageViewStack.imageView.isHidden = true
  }
  
  func hideDeleteImageButton() {
    self.imageViewStack.deleteImageButton.isHidden = true
  }

}
