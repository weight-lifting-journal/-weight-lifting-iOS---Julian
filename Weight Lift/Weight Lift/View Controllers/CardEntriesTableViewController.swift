//
//  CardEntriesTableViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/11/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class CardEntriesTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = workoutJournal?.identifier
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutJournal?.exerciseCards.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.reuseIdentifier, for: indexPath) as? CardTableViewCell else { fatalError("Unable to dequeue cell") }
        guard let workoutJournals = workoutJournal?.exerciseCards else { return cell}

        let workout = workoutJournals[indexPath.row]

        cell.journalLabel?.text = workout.journalID
        cell.exerciseLabel?.text = workout.name
        cell.repsLabel?.text = workout.reps
        cell.setsLabel?.text = workout.sets
        cell.weightLabel?.text = workout.weight

        return cell
    }

    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    
    }
 
    

 
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cardcell" {
            guard let cardDetailVC = segue.destination as? CardEntriesDetailViewController else { return }
            
            cardDetailVC.workoutJournal = workoutJournal
            cardDetailVC.networkController = networkController
        }
    }
    
    
    // MARK: - Properties
    var networkController: NetworkController?
    var workoutJournal: WorkoutJournal?
    
}
