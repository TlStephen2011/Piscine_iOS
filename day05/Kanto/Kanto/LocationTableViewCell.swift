//
//  LocationTableViewCell.swift
//  Kanto
//
//  Created by Tyrone STEPHEN on 2019/10/14.
//  Copyright © 2019 Tyrone Stephen. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    //MARK: properties    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
