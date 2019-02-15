//
//  EntriesTableViewController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class JournalEntriesTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        networkController?.getWorkoutJournals(completion: { (error) in
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return networkController?.workoutJournals.count ?? 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JournalTableViewCell.reuseIdentifier, for: indexPath) as? JournalTableViewCell else { fatalError("Unable to dequeue cell") }
        
        let workoutJournal = networkController?.workoutJournals[indexPath.row]
        
        cell.dateLabel?.text = workoutJournal?.date
        cell.journalIDLabel?.text = workoutJournal?.identifier
        cell.regionLabel?.text = workoutJournal?.region
        
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }

    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? JournalEntriesDetailViewController, let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
    }
 
    
    // MARK: - Properties
    
    var networkController: NetworkController?
    var workoutJournal: WorkoutJournal?
    
    
    
}
