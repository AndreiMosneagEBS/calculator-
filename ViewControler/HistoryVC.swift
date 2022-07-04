//
//  HistoryVC.swift
//  Calculator
//
//  Created by Andrei Mosneag on 24.06.2022.
//

import Foundation
import UIKit

class HistoryVC: UIViewController {
    let historyCalculate = UserDefaults.standard.object(forKey: "calculate") as? [String]
    let historyResults = UserDefaults.standard.object(forKey: "results") as? [String]
    
    struct History {
        let workings: String
        let result: String
    }
    
    var dataSource: [History] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.identifier)
        
        
        if let historyCalculateResults = UserDefaults.standard.object(forKey: "calculateResult") as? [[String : String]] {
            
            
            for dictionary in historyCalculateResults {
                let history = History(workings: dictionary["workings"] ?? "",
                                      result: dictionary["result"] ?? "")
                dataSource.append(history)
                dataSource.sorted(by: {$0.workings < $1.workings})
            }
        }
        
        tableView.reloadData()
        
    }
}
extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let sortedData = dataSource.sorted(by: {$0.workings > $1.result})
        let history = sortedData[indexPath.row]
        let params: TableViewCell.Params = .init(numbers: history.workings, results: history.result)
     cell.setup(param: params)
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


