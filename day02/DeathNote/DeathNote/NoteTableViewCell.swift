//
//  NoteTableViewCell.swift
//  DeathNote
//
//  Created by Tyrone STEPHEN on 2019/10/11.
//  Copyright © 2019 Tyrone STEPHEN. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
