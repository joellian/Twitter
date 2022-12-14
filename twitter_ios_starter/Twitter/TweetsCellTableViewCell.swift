//
//  TweetsCellTableViewCell.swift
//  Twitter
//
//  Created by Joel Lian on 10/3/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetsCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileimageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
