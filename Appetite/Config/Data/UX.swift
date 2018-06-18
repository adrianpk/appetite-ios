//
//  UX
//  Appetite
//
//  Created by Adrian on 12/1/16.
//  Copyright © 2016 Kuguar. All rights reserved.
//

import UIKit

class UX {

  enum Palette {
    case viewBackground
    case selectorButton
    case buttonTextLight
    case segueButton
    case actionButton
    case cellBackground
    case cellFont
    case cellBackgroundHighlighted
    case cellFontHighlighted
    case cellBackgroundDeemphasized
    case cellFontDeemphasized
    case onColor
    case offColor
    
    
    fileprivate static let value: [Palette: UIColor] = [
      viewBackground: UIColor(hexa: 0xFFFFFF),
      buttonTextLight: UIColor.white,
      selectorButton: UIColor(hexa: 0xFF318F),
      segueButton: UIColor(hexa: 0x0099F7),
      actionButton: UIColor(hexa: 0x9642F4),
      cellBackground: UIColor(hexa: 0xFFFFFF),
      cellFont: UIColor(hexa: 0x000000),
      cellBackgroundHighlighted: UIColor(hexa: 0xBBF853),
      cellFontHighlighted: UIColor(hexa: 0xFF221B),
      cellBackgroundDeemphasized: UIColor(hexa: 0xEBEBEB),
      cellFontDeemphasized: UIColor(hexa: 0x797979),
      onColor: UIColor(hexa: 0x0099F7),
      offColor: UIColor(hexa: 0x000000),
    ]
    
    var uicolor: UIColor {
      return Palette.value[self]!;
    }
    
    var cgcolor: CGColor {
      return Palette.value[self]!.cgColor;
    }
  }
  
  enum Measurement {
    case mainLeadingMargin
    case mainTopMargin
    case mainTrailingMargin
    case spacing

    public static let value: [Measurement: CGFloat] = [
      mainLeadingMargin: 8.0,
      mainTopMargin: 0.0,
      mainTrailingMargin: 8.0,
      spacing: 8.0
    ]
    
    var cgFloat: CGFloat {
      return CGFloat(Measurement.value[self]!)
    }
  }

}
