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
    @IBOutlet weak var minusNumber: UIButton!
    
    
    var workings:String = ""
    let characters = ["*", "/", "+", "-"]
    var calculateHistory: [String] = []
    var resultatHistory: [String] = []
    var calculateResult: [[String:String]] = []
    var dict: [String:String ]?
    var arithmeticValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        equalsButtonSetings()
    }
    
    private func clearAll() {
        workings = ""
        guard let calculatorWorkings = calculatorWorkings else {
            return
        }
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
   private func equalsButtonSetings() {
        guard let equalSetings = equalOutlet else {
            return
        }
        equalSetings.layer.cornerRadius = 4
    }
    
     
    @IBAction func equalsTap(_ sender: Any){
        // Modificat
//        print(arithmeticValue)
        
        
        if validInput()  {
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            print(checkedWorkingsForPercent)
            let expression = NSExpression(format: checkedWorkingsForPercent)
            print(expression)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            print(result)
            let resultString = formatResult(result: result)
            calculatorWorkings.text = workings
            calculatorResults.text = resultString
            calculateResult.append(["workings": workings, "result": resultString])
            UserDefaults.standard.set(calculateResult, forKey: "calculateResult")
            
        } else {
            invalidInput()
        }
    }
    
    private func invalidInput() {
        let alert = UIAlertController(
            title: "Invalid Input",
            message: "Calculator unable to do math based on input",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    private func validInput() ->Bool { // Modificat
        print(workings.prefix(1))
        if characters.contains(String(workings.suffix(1))) ||
            characters.contains(String(workings.prefix(1))) {
            return false
        }else {
            return true
        }
    }
    
   private  func specialCharacter (char: Character) -> Bool {    // Modificat
        if characters.contains(String(char)) {
            return true
        }else {
            return false
        }
    }
    
   private  func formatResult(result: Double) -> String
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
    
   private func lastCharacter(_ value: String? = nil) -> Bool {
        
        let lastCharacter = workings.suffix(1)
        let stringLastCharacter = String(lastCharacter)
        if characters.contains(value ?? "") && characters.contains(stringLastCharacter) {
             return true
        } else {
            return false
        }
    }
    
    
    
   private func addToWorkings(value: String) {  // Modificat
        self.arithmeticValue = value
        if lastCharacter(value) {
            workings.removeLast()
        }
        workings = workings + value
        calculatorResults.text = workings
        
    }
    
   private func minusChange() {
        if workings.prefix(1) == "-" {
            workings.removeFirst()
            calculatorResults.text = workings
        } else {
            workings = "-\(workings)"
            calculatorResults.text = workings
        }
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
    
    @IBAction func minusNumber(_ sender: UIButton) {
        minusChange()
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
