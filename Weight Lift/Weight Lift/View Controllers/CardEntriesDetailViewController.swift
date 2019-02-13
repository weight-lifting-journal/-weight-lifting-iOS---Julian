//
//  AddEntryViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class CardEntriesDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCard(_ sender: Any) {
                
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Properties
    @IBOutlet weak var cardJournalTextField: UITextField!
    @IBOutlet weak var cardExerciseTextField: UITextField!
    @IBOutlet weak var cardRepsTextField: UITextField!
    @IBOutlet weak var cardSetsTextField: UITextField!
    @IBOutlet weak var cardWeightTextField: UITextField!
    @IBOutlet weak var cardSaveButton: UIButton!
    

}
