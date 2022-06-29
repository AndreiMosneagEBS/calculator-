//
//  ViewController.swift
//  Calculator
//
//  Created by Andrei Mosneag on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    
    @IBOutlet weak var percentButtonOutlet: UIButton!
    @IBOutlet weak var clerOutlet: UIButton!
    @IBOutlet weak var devideOutlet: UIButton!
    @IBOutlet weak var timersOutlet: UIButton!
    @IBOutlet weak var minusOutlet: UIButton!
    @IBOutlet weak var plusOutlet: UIButton!
    @IBOutlet weak var equalOutlet: UIButton!
    
    var workings:String = ""
    var calculateHistory: [String] = []
    var resultatHistory: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        clearAll()
        equalsButtonSetings()
    }
    
    
    
    func clearAll() {
        workings = ""
        guard let calculatorWorkings = calculatorWorkings else {
            return
        }
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    func equalsButtonSetings() {
        guard let equalSetings = equalOutlet else {
            return
        }
        equalSetings.layer.cornerRadius = 4
    }
    
     
    @IBAction func equalsTap(_ sender: Any){
        if(validInput()) {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "% f", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorWorkings.text = workings
            calculateHistory.append(workings)
            UserDefaults.standard.set(calculateHistory, forKey: "calculate")
            
            calculatorResults.text = resultString
            resultatHistory.append(resultString)
            UserDefaults.standard.set(resultatHistory, forKey: "results")
            
            

            
            
        } else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
   
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings
        {
            if(specialCharacter(char: char))
            {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            if(index == 0)
            {
                return false
            }
            
            if(index == workings.count - 1)
            {
                return false
            }
            
            if (previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        if(char == "+")
        {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func allClearTap(_ sender: Any)
    {
        clearAll()
    }
    
    @IBAction func backTap(_ sender: Any)
    {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorResults.text = workings
        }
    }
    
    func addToWorkings(value: String)
    {
        workings = workings + value
        calculatorResults.text = workings
    }
    
    @IBAction func percentTap(_ sender: Any)
    {
        addToWorkings(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any)
    {
        addToWorkings(value: "/")
    }
    
    @IBAction func timesTap(_ sender: Any)
    {
        addToWorkings(value: "*")
    }
    
    @IBAction func minusTap(_ sender: Any)
    {
        addToWorkings(value: "-")
    }
    
    @IBAction func plusTap(_ sender: Any)
    {
        addToWorkings(value: "+")
    }
    
    @IBAction func decimalTap(_ sender: Any)
    {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: Any)
    {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any)
    {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any)
    {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any)
    {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any)
    {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any)
    {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any)
    {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any)
    {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any)
    {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTap(_ sender: Any)
    {
        addToWorkings(value: "9")
    }
    @IBAction func historyButton(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryVC") as? HistoryVC {
            present(viewController, animated: true)
    
          }
    }
    
    @IBAction func settingButtonAction(_ sender: Any) {
        if let viewControler = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"SettingsVC") as? SettingsVC {
            present(viewControler, animated: true)
            viewControler.delegate = self
        }
            
    }
    
}

extension ViewController: SettingsVCDelegate {
    func changeColor(color: UIColor) {
        percentButtonOutlet.tintColor = color
        clerOutlet.tintColor = color
        devideOutlet.tintColor = color
        timersOutlet.tintColor = color
        minusOutlet.tintColor = color
        plusOutlet.tintColor = color
        equalOutlet.backgroundColor = color
        equalOutlet.tintColor = .systemBackground
        
    }
}
