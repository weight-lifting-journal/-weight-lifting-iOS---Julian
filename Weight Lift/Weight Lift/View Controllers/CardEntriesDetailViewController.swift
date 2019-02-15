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
        navigationItem.title = workoutJournal?.identifier
    }
    
    @IBAction func saveCard(_ sender: Any) {
        guard let reps = cardRepsTextField.text,
            let sets = cardSetsTextField.text,
            let weight = cardWeightTextField.text,
            let identifier = cardJournalTextField.text,
            let name = cardExerciseTextField.text,
            let workoutJournal = workoutJournal,
            let networkController = networkController else { return }
        
        networkController.createExerciseCard(workoutJournal: workoutJournal, journalID: identifier, name: name, reps: reps, sets: sets, weight: weight) { (error) in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
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
    @IBOutlet weak var cardJournalTextField: UITextField!
    @IBOutlet weak var cardExerciseTextField: UITextField!
    @IBOutlet weak var cardRepsTextField: UITextField!
    @IBOutlet weak var cardSetsTextField: UITextField!
    @IBOutlet weak var cardWeightTextField: UITextField!
    @IBOutlet weak var cardSaveButton: UIButton!
    

    var workoutJournal: WorkoutJournal?
    var networkController: NetworkController?
}
