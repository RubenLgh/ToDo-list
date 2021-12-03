//
//  TableViewCell.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 03/12/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
