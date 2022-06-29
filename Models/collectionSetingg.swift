//
//  collectionSetingg.swift
//  Calculator
//
//  Created by Andrei Mosneag on 24.06.2022.
//

import Foundation
import UIKit

class CustomSegmentControl: UISegmentedControl {
    
  override func layoutSubviews(){
    super.layoutSubviews()
    
    let segmentStringSelected: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.foregroundColor : UIColor.white
    ]
    
    let segmentStringHighlited: [NSAttributedString.Key : Any] = [
      NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.5567105412, green: 0.5807551742, blue: 0.6022000909, alpha: 1)
    ]
    
    setTitleTextAttributes(segmentStringHighlited, for: .normal)
    setTitleTextAttributes(segmentStringSelected, for: .selected)
    setTitleTextAttributes(segmentStringHighlited, for: .highlighted)
    
    layer.masksToBounds = true
    
    if #available(iOS 13.0, *) {
        selectedSegmentTintColor = .clear
    } else {
        tintColor = .red
    }
    
      backgroundColor = .systemBackground
    
    //corner radius
    let cornerRadius = bounds.height / 2
    let maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    //background
    clipsToBounds = true
    layer.cornerRadius = cornerRadius
    layer.maskedCorners = maskedCorners

    let foregroundIndex = numberOfSegments
    if subviews.indices.contains(foregroundIndex),
      let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
      foregroundImageView.image = UIImage()
      foregroundImageView.clipsToBounds = true
      foregroundImageView.layer.masksToBounds = true
        foregroundImageView.backgroundColor = .init(rgb: 0x11998E)
      
      foregroundImageView.layer.cornerRadius = bounds.height / 2 + 5
      foregroundImageView.layer.maskedCorners = maskedCorners
    }
  }
  
  override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return false
  }
  
   
    
}



