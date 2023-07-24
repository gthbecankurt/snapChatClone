//
//  FeedCell.swift
//  SnapchatCloneB
//
//  Created by Emirhan Cankurt on 14.02.2023.
//

import UIKit

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
