//
//  ListViewCell.swift
//  Assignment
//
//  Created by Benuka Withanage on 4/25/20.
//  Copyright © 2020 Benuka Withanage. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
