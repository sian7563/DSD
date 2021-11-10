//
//  TableViewCell.swift
//  Dasida
//
//  Created by kimsian on 2021/11/09.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var listLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listLabel.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
