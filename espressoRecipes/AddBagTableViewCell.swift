//
//  AddBagTableViewCell.swift
//  espressoRecipes
//
//  Created by Michael Williams on 9/14/17.
//  Copyright © 2017 Michael D. Williams. All rights reserved.
//

import UIKit

class AddBagTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addBagTextEntryTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBagTextEntryTextView.isScrollEnabled = false
        let inset: CGFloat = (self.contentView.frame.height/2) - (addBagTextEntryTextView.contentSize.height/2)
        addBagTextEntryTextView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0)
    }
    
    
}


