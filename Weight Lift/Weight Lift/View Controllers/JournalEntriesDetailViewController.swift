//
//  EntriesViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class JournalEntriesDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveJournal(_ sender: Any) {
        
        guard let journalID = journalTextField.text, !journalID.isEmpty,
              let date = dateTextField.text, !date.isEmpty,
              let region = regionTextField.text, !region.isEmpty else { return }
        
        NetworkController.createWorkoutJournal(date: date, region: region, journalID: 1) { (error) in
            if let error = error {
                NSLog("Could not update activity: \(error)")
                return
            }
        }
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
    
    @IBOutlet weak var journalTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let networkController = NetworkController()
}
