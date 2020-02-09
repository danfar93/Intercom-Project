//
//  InvitedCustomerCell.swift
//  Intercom-Tech-Test
//
//  Created by Daniel Farrell on 07/02/2020.
//  Copyright © 2020 Daniel Farrell. All rights reserved.
//

import UIKit

class InvitedCustomerCell: UITableViewCell {

    
    @IBOutlet var customerNameLabel: UILabel!
    @IBOutlet var userIdLabel: UILabel!

    @IBOutlet var backingView: UIView!
    
        override func awakeFromNib() {
            super.awakeFromNib()

            backingView.layer.cornerRadius = 10
            backingView.layer.masksToBounds = true
         
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)


        }

    }
