//
//  UIColor+toHex.swift
//  ConstrastCheckerTeste
//
//  Created by Andre Casarini on 30/01/23.
//

import UIKit

extension UIColor {
  var toHex: String {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    
    getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    let redHex = Int(red * 255)
    let greenHex = Int(green * 255)
    let blueHex = Int(blue * 255)
    
    return String(format: "%02X%02X%02X", redHex, greenHex, blueHex)
  }
}
