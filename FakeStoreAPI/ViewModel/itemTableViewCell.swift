//
//  itemTableViewCell.swift
//  FakeStoreAPI
//
//  Created by Hafizh Caesandro Kevinoza on 27/10/22.
//

import UIKit

class itemTableViewCell: UITableViewCell {
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
