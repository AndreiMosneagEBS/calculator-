//
//  UiButon+.swift
//  Calculator
//
//  Created by Andrei Mosneag on 24.06.2022.
//
a
import Foundation
import UIKit

extension UIButton {
    func setCornerRadius(radius: Int) {
       self.layer.cornerRadius = CGFloat(radius)
   }
}

extension UIButton {
  func shortChangeTo(_ color:UIColor) {
    let prev = self.backgroundColor
    self.backgroundColor = color
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
       self.backgroundColor = prev
    }
  }
}

extension UIColor {

    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
