//
//  TransactionTableViewCell.swift
//  My Personal Budget
//
//  Created by Michelangelo Amoruso Manzari on 28/04/23.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelAmount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
