//
//  UIViewController.swift
//  Appetite
//
//  Created by Adrian on 1/15/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit

extension UIViewController {

  // MARK: Misc.
  func appDelegateRef() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  func navBarSize() -> CGSize {
    guard let navigationController = navigationController else {
      return CGSize.zero
    }
    return navigationController.navigationBar.frame.size
  }
  
  func tabBarSize() -> CGSize {
    guard let tabViewController = appDelegateRef().tabViewController else {
      return CGSize.zero
    }
    return tabViewController.tabBar.frame.size
  }

}
