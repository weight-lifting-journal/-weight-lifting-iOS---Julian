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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func saveJournal(_ sender: Any) {
        
        guard let journalID = journalTextField.text, !journalID.isEmpty,
              let date = dateTextField.text, !date.isEmpty,
              let region = regionTextField.text, !region.isEmpty
            else { return }
        
        networkController.createWorkoutJournal(date: date, region: region) { (error) in
            if let error = error {
                print(error)
                return
        }
    }
}
    
   
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTableView" {
            let journalTVC = segue.destination as! JournalEntriesTableViewController
            journalTVC.networkController = networkController
        }


    }
    
    
    // MARK: - Properties
    
    @IBOutlet weak var journalTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var workoutJournal: WorkoutJournal?
    var networkController = NetworkController()
    let journalTableVC = JournalEntriesTableViewController()
}
