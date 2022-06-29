//
//  SetingsVC.swift
//  Calculator
//
//  Created by Andrei Mosneag on 24.06.2022.
//
 
protocol SettingsVCDelegate {
    func changeColor (color: UIColor)
}


import Foundation
import UIKit
class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var segmentedControlCostum: CustomSegmentControl!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var violetButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var grayButton: UIButton!
    @IBOutlet weak var azureButton: UIButton!
    
    
    var delegate: SettingsVCDelegate?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        cornerRadiusButtonColor()

    }
    
     func cornerRadiusButtonColor() {
         greenButton.setCornerRadius(radius: 4)
         violetButton.setCornerRadius(radius: 4)
         yellowButton.setCornerRadius(radius: 4)
         blueButton.setCornerRadius(radius: 4)
         blackButton.setCornerRadius(radius: 4)
         grayButton.setCornerRadius(radius: 4)
         azureButton.setCornerRadius(radius: 4)
         
         greenButton.backgroundColor = ColorManager.colors[0].color
         violetButton.backgroundColor = ColorManager.colors[1].color
         yellowButton.backgroundColor = ColorManager.colors[2].color
         blueButton.backgroundColor = ColorManager.colors[3].color
          let selecetedColorId = ColorManager.getSavetColorId()
         
         greenButton.isSelected = selecetedColorId == ColorManager.colors[0].clorId
         violetButton.isSelected = selecetedColorId == ColorManager.colors[1].clorId
         yellowButton.isSelected = selecetedColorId == ColorManager.colors[2].clorId
         blueButton.isSelected = selecetedColorId == ColorManager.colors[3].clorId


        
    }
 
    
    private func isSelectedButtonSetings(){
        greenButton.isSelected = false
        violetButton.isSelected = false
        yellowButton.isSelected = false
        blueButton.isSelected = false
    }    
    
    private func buttonIsSelected(sender: UIButton) {
        if  !sender.isSelected {
            isSelectedButtonSetings()
            sender.isSelected = true
        }
        
    }
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIApplication.shared.keyWindowInConnectedScenes?.overrideUserInterfaceStyle = .light
        }
        if sender.selectedSegmentIndex == 1 {
            UIApplication.shared.keyWindowInConnectedScenes?.overrideUserInterfaceStyle = .dark

        }
    }

    
    
// MARK: - Action Change Colour Button
    @IBAction func actionGreenButton(_ sender: UIButton) {
        let selectedColor = ColorManager.colors[0]
        delegate?.changeColor(color: selectedColor.color)
        ColorManager.saveColor(color: selectedColor)
        buttonIsSelected(sender: sender)
        }

    
    
    @IBAction func actionVioletButton(_ sender: UIButton) {
        let selectedColor = ColorManager.colors[1]
        delegate?.changeColor(color: selectedColor.color)
        ColorManager.saveColor(color: selectedColor)
        buttonIsSelected(sender: sender)

    }
    // rgb: 0xFFCC00)
    
    @IBAction func actionYellowButton(_ sender: UIButton) {
        let selectedColor = ColorManager.colors[2]
        delegate?.changeColor(color: selectedColor.color)
        ColorManager.saveColor(color: selectedColor)
        buttonIsSelected(sender: sender)


    }
    
    @IBAction func actionBlueButton(_ sender: UIButton) {
        let selectedColor = ColorManager.colors[3]
        delegate?.changeColor(color: selectedColor.color)
        ColorManager.saveColor(color: selectedColor)
        buttonIsSelected(sender: sender)


    }
    
    // MARK: - Action Change Colour Text

    @IBAction func actionBlackButton(_ sender: UIButton) {
        buttonIsSelected(sender: sender)

    }
    
    @IBAction func actionGrayButton(_ sender: UIButton) {
        buttonIsSelected(sender: sender)

    }
    
    @IBAction func actionazureButton(_ sender: UIButton) {
        buttonIsSelected(sender: sender)

    }
    
    
    
}

