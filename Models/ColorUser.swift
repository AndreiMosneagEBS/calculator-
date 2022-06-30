//
//  File.swift
//  Calculator
//
//  Created by Andrei Mosneag on 28.06.2022.
//

import Foundation
import UIKit

struct ColorUser {
    let clorId: Int
    let color: UIColor
}
class ColorManager {
    
    static let colors: [ColorUser] = [
        ColorUser(clorId: 1, color: #colorLiteral(red: 0.06475427002, green: 0.6011719704, blue: 0.5578446984, alpha: 1) ),
        ColorUser(clorId: 2, color: #colorLiteral(red: 1, green: 0.8001160026, blue: 0.006338531151, alpha: 1) ),
        ColorUser(clorId: 3, color: #colorLiteral(red: 0.5117388368, green: 0.1294717193, blue: 0.9947513938, alpha: 1) ),
        ColorUser(clorId: 4, color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) )
        
    ]
    
    static func saveColor(color: ColorUser) {
        UserDefaults.standard.set(color.clorId, forKey: "UserColor")
    }
    
    static func getSavetColor()-> ColorUser {
       let colorId =  getSavetColorId()
       let userColor =  colors.first { color in
            return color.clorId == colorId
            
        }
        return userColor ?? ColorUser(clorId: 1, color:  #colorLiteral(red: 0.5567105412, green: 0.5807551742, blue: 0.6022000909, alpha: 1))
    }
  static  func getSavetColorId() -> Int {
     return  UserDefaults.standard.integer(forKey: "UserColor")
    }
}

