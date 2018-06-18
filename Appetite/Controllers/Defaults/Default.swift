//
//  Default.swift
//  Appetite
//
//  Created by Adrian on 1/17/17.
//  Copyright © 2017 Kuguar. All rights reserved.
//

import UIKit
import Controls

class Default {
  
  class func appDelegateRef() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  class func navBarSize(navigationController: UINavigationController?) -> CGSize {
    guard let navigationController = navigationController else {
      return CGSize.zero
    }
    return navigationController.navigationBar.frame.size
  }
  
  class func tabBarSize() -> CGSize {
    guard let tabViewController = appDelegateRef().tabViewController else {
      return CGSize.zero
    }
    return tabViewController.tabBar.frame.size
  }
  
  class func scrollingStackParams() -> UIParams {
    let params = UIParams()
    params.width = UIScreen.main.bounds.width
    params.backgroundColor = UX.Palette.viewBackground.uicolor
    params.topMargin = UX.Measurement.mainTopMargin.cgFloat
    params.bottomLayoutGuideSize = self.appDelegateRef().tabViewController!.tabBar.frame.size.height
    params.leftMargin = CGFloat(0)
    params.rightMargin = CGFloat(0)
    params.spacing = CGFloat(10)
    return params
  }
  
  class func scrollViewParams() -> UIParams {
    let params = UIParams()
    params.width = UIScreen.main.bounds.width
    params.backgroundColor = UX.Palette.viewBackground.uicolor
    return params
  }
  
  class func tableViewParams() -> UIParams {
    let params = UIParams()
    params.width = UIScreen.main.bounds.width
    params.backgroundColor = UX.Palette.viewBackground.uicolor
    return params
  }
  
  class func mainStackParams() -> UIParams {
    let sharedApp = UIApplication.shared
    let appDelegate = sharedApp.delegate as! AppDelegate
    let params = UIParams()
    params.distribution = .fill
    params.alignment = .fill
    params.topMargin = UX.Measurement.mainTopMargin.cgFloat
    params.bottomLayoutGuideSize = appDelegate.tabViewController!.tabBar.frame.size.height
    params.hMargin = UX.Measurement.mainLeadingMargin.cgFloat
    params.vMargin = UX.Measurement.mainTopMargin.cgFloat // Fix: Just in case CGFloat(8.0)
    params.leftMargin = CGFloat(16.0)
    params.rightMargin = CGFloat(16.0)
    params.topMargin = CGFloat(4.0)
    params.spacing = CGFloat(10.0)
    return params
  }
  
  class func hStackParams() -> UIParams {
    let params = UIParams()
    params.distribution = .fill
    params.alignment = .fill
    params.hMargin = CGFloat(16.0)
    params.vMargin = CGFloat(8.0)
    params.leftMargin = CGFloat(16.0)
    params.rightMargin = CGFloat(16.0)
    params.topMargin = CGFloat(4.0)
    params.spacing = CGFloat(10.0)
    return params
  }
  
  class func titleLabelParams(withText text: String) -> UIParams {
    let params = UIParams()
    params.fontName = UIFont.preferredFont(forTextStyle: .title1).fontName
    params.fontSize = UIFont.preferredFont(forTextStyle: .title1).pointSize
    params.text = text
    return params
  }
  
  class func horizontalStackParams() -> UIParams {
    let params = UIParams()
    params.leftMargin = CGFloat(10)
    params.rightMargin = CGFloat(10)
    params.spacing = CGFloat(10)
    return params
  }
  
  class func textFieldParams(placeholder: String = "") -> UIParams {
    let params = UIParams()
    params.fontName = ".SFUIText-Medium"
    params.fontSize = 14.0
    params.placeholder = placeholder
    return params
  }
  
  class func textFieldStackParams(title: String = "", placeholder: String = "") -> UIParams {
    let params = UIParams()
    params.fontName = ".SFUIText-Semibold"
    params.fontSize = 14.0
    params.title = title
    params.placeholder = placeholder
    return params
  }
  
  class func textViewStackParams(title: String = "", size: CGSize? = nil) -> UIParams {
    let params = UIParams()
    switch size != nil {
    case true:
      params.width = size!.width
      params.height = size!.height
    default:
      let windowBounds = self.appDelegateRef().window?.bounds
      params.width = windowBounds!.width - 16
      params.height = params.width * 0.75
    }
    params.fontName = ".SFUIText-Medium"
    params.fontSize = 14.0
    params.title = title
    return params
  }
  
  class func selectorButtonParams(title: String = "", backgroundColor: UIColor = UX.Palette.selectorButton.uicolor, fontColor: UIColor = UX.Palette.buttonTextLight.uicolor) -> UIParams {
    let params = buttonParams(title: title)
    params.backgroundColor = backgroundColor
    params.textColor = fontColor
    return params
  }
  
  class func segueButtonParams(title: String = "", backgroundColor: UIColor = UX.Palette.segueButton.uicolor, fontColor: UIColor = UX.Palette.buttonTextLight.uicolor) -> UIParams {
    let params = buttonParams(title: title)
    params.backgroundColor = backgroundColor
    params.textColor = fontColor
    return params
  }
  
  class func actionButtonParams(title: String = "", backgroundColor: UIColor = UX.Palette.actionButton.uicolor, fontColor: UIColor = UX.Palette.buttonTextLight.uicolor) -> UIParams {
    let params = buttonParams(title: title)
    params.backgroundColor = backgroundColor
    params.textColor = fontColor
    return params
  }
  
  class func buttonParams(title: String = "") -> UIParams {
    let params = UIParams()
    params.title = title
    params.fontName = UIFont.preferredFont(forTextStyle: .body).fontName
    params.fontSize = UIFont.preferredFont(forTextStyle: .body).pointSize
    return params
  }
  
  class func switchParams(isOn: Bool = false, onColor: UIColor = UX.Palette.onColor.uicolor, offColor: UIColor = UX.Palette.offColor.uicolor) -> UIParams {
    let params = UIParams()
    params.isOn = isOn
    return params
  }
  
  class func switchStackParams(title: String = "", titlePlacement: titlePlacement = .left, isOn: Bool = false, onColor: UIColor = UX.Palette.onColor.uicolor, offColor: UIColor = UX.Palette.offColor.uicolor) -> UIParams {
    let params = UIParams()
    params.title = title
    params.titlePlacement = titlePlacement
    params.isOn = isOn
    params.fontName = ".SFUIText-Medium"
    params.fontSize = 14.0
    return params
  }
  
  class func imageViewStackParams(title: String = "", size: CGSize? = nil) -> UIParams {
    let params = UIParams()
    switch size != nil {
    case true:
      params.width = size!.width
      params.height = size!.height
    default:
      let windowBounds = self.appDelegateRef().window?.bounds
      params.width = windowBounds!.width - 16
      params.height = params.width * 0.75
    }
    params.fontName = ".SFUIText-Medium"
    params.fontSize = 14.0
    params.title = title
    return params
  }
  
  class func pickerStackParams(title: String = "", closeText: String = "") -> UIParams {
    let params = UIParams()
    params.fontName = ".SFUIText-Medium"
    params.fontSize = 14.0
    params.title = title
    params.closeText = closeText
    return params
  }
  
  class func tableParams() -> UIParams {
    let params = UIParams()
    return params
  }
  
}
