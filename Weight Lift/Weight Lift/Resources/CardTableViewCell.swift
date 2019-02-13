//
//  CardTableViewCell.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/11/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    static let reuseIdentifier = "cardcell"
    // MARK: - Properties
    
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var exerciseLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    

}
