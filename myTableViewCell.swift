//
//  myTableViewCell.swift
//  To-Do List
//
//  Created by Licheng Xu on 10/17/16.
//  Copyright © 2016 Licheng Xu. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var cellName: UILabel!
    
    
    var callback: ((myTableViewCell) -> ())? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func onSwitch(_ sender: AnyObject) {
        if callback != nil {
            callback!(self)
        }
    }
    
}
