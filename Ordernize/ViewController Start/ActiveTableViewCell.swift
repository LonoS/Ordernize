//
//  ActiveTableViewCell.swift
//  Ordernize
//
//  Created by Paul Wiesinger on 12.05.18.
//  Copyright © 2018 Paul Wiesinger. All rights reserved.
//

import UIKit

class ActiveTableViewCell: UITableViewCell {

    @IBOutlet weak var gruppenname: UILabel!
    @IBOutlet weak var gruppenbeschreibung: UILabel!
    @IBOutlet weak var teilnehmer: UILabel!
    @IBOutlet weak var remainingBetrag: UILabel!
    @IBOutlet weak var activeTeilnehmer: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var statusLamp: RoundedViewWithShadow!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
