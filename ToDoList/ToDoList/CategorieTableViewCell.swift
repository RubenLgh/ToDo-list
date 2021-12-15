//
//  CategorieTableViewCell.swift
//  ToDoList
//
//  Created by Ruben Laghouati on 15/12/2021.
//

import UIKit

class CategorieTableViewCell: UITableViewCell {
    

    @IBOutlet weak var categorie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
