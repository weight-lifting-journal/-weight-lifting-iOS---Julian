//
//  JournalTableViewCell.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/11/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    static let reuseIdentifier = "journalcell"

    
    // MARK: - Properties
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var journalIDLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    

}
