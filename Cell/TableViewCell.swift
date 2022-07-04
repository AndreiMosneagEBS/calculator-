//
//  TableViewCell.swift
//  Calculator
//
//  Created by Andrei Mosneag on 23.06.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    
    @IBOutlet private weak var numbersCalculate: UILabel!
    @IBOutlet private weak var resultat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        resetView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectionStyle = .none
//        resetView()
    }
    
//    private func resetView() {
//        numbersCalculate.text = nil
//        resultat.text = nil
//    }
    
    struct Params {
        var numbers: String?
        var results: String?
    }
    
    func setup(param: Params) {
        numbersCalculate.text = param.numbers
        resultat.text = param.results
    }
}
