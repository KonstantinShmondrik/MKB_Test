//
//  RatesTableViewCell.swift
//  MKB Test
//
//  Created by Константин Шмондрик on 21.04.2022.
//

import UIKit

class RatesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currMnemFrom: UILabel!
    @IBOutlet weak var currMnemTo: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sale: UILabel!
    @IBOutlet weak var deltaBuy: UILabel!
    @IBOutlet weak var deltaSale: UILabel!
    @IBOutlet weak var buy: UILabel!
    @IBOutlet weak var tp: UILabel!
    @IBOutlet weak var basic: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var to: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(currMnemFrom: String, currMnemTo: String, name: String, sale: String, from: Int, to: Int, deltaBuy: String, deltaSale: String, buy: String, tp: Int, basic: String) {
        
        self.currMnemFrom.text = currMnemFrom
        self.currMnemTo.text = currMnemTo
        self.name.text = name
        self.sale.text = sale
        self.from.text = String(from)
        self.to.text = String(to)
        self.deltaBuy.text = deltaBuy
        self.deltaSale.text = deltaSale
        self.buy.text = buy
        self.tp.text = String(tp)
        self.basic.text = basic
        
    }
    
    
    
}
