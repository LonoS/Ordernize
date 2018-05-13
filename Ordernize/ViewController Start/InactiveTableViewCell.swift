//
//  InactiveTableViewCell.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 12.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

class InactiveTableViewCell: UITableViewCell {

    @IBOutlet weak var gruppenname: UILabel!
    @IBOutlet weak var gruppenbeschreibung: UILabel!
    @IBOutlet weak var teilnehmer: UILabel!
    @IBOutlet weak var letzteBestellung: UILabel!
    @IBOutlet weak var statuslamp: RoundedViewWithShadow!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
