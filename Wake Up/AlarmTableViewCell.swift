//
//  AlarmTableViewCell.swift
//  Wake Up
//
//  Created by Robbie Zuazua  on 1/30/18.
//  Copyright © 2018 HackMind. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alarmDescriptionLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alarmSwitch.onTintColor = UIColor.wakeupTintColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
