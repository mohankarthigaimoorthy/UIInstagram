//
//  imageTableViewCell.swift
//  instagaramUI
//
//  Created by Mohan K on 27/02/23.
//

import UIKit

class imageTableViewCell: UITableViewCell {

    @IBOutlet weak var viewUI: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var images: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
