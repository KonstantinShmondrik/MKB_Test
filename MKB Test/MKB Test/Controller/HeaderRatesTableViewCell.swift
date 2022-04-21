//
//  HeaderRatesTableViewCell.swift
//  MKB Test
//
//  Created by Константин Шмондрик on 21.04.2022.
//

import UIKit

class HeaderRatesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratesDate: UILabel!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var rid: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var downloadDate: UILabel!
    @IBOutlet weak var productState: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    func configurate(ratesDate: String, messageTitle: String, code: Int, rid: String, message: String, downloadDate: String, productState: Int) {
        
        self.ratesDate.text = ratesDate
        self.messageTitle.text = messageTitle
        self.code.text = String(code)
        self.rid.text = rid
        self.message.text = message
        self.downloadDate.text = downloadDate
        self.productState.text = String(productState)
        
    }
    
    
}
