//
//  NetworkController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/5/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation


class NetworkController {
    
    var workoutJournals: [WorkoutJournal] = []
    
    static let baseURL = URL(string: "https://fit-me-9b1b0.firebaseio.com/")!
    
    
    // Create a workout journal
     func createWorkoutJournal(date: String, region: String, completion: @escaping (Error?) -> Void) {
        
        let newWorkoutJournal = WorkoutJournal(date: date, region: region)
        self.workoutJournals.append(newWorkoutJournal)
        let journalURL = NetworkController.baseURL.appendingPathComponent(newWorkoutJournal.identifier)
        let jsonJournalURL = journalURL.appendingPathExtension("json")
        
        var request = URLRequest(url: jsonJournalURL)
        request.httpMethod = "PUT"
        
        let encoder = JSONEncoder()
        
        do {
            request.httpBody = try encoder.encode(newWorkoutJournal)
        } catch {
            print(NSError())
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
    
        
            completion(nil)
        }.resume()
        
    }
    
    // Create a new exercise card
    func createExerciseCard(workoutJournal: WorkoutJournal, journalID: String, name: String, reps: String, sets: String, weight: String , completion: @escaping (Error?) -> Void) {
        
        let newExerciseCard = WorkoutJournal.ExerciseCard(journalID: journalID, name: name, reps: reps, sets: sets, weight: weight)
        
        let workoutJournalURL = NetworkController.baseURL.appendingPathComponent(workoutJournal.identifier)
        
        let exerciseURL = workoutJournalURL.appendingPathComponent("exerciseCards")
        let jsonExerciseURL = exerciseURL.appendingPathExtension("json")
        
        var url = URLRequest(url: jsonExerciseURL)
        url.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        
        do {
            url.httpBody = try encoder.encode(newExerciseCard)
            
        } catch {
            print(NSError())
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (_, _, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
            workoutJournal.exerciseCards.append(newExerciseCard)
            completion(nil)
        }.resume()
  }
    
    // Get workout journal
    func getWorkoutJournals(completion: @escaping (Error?) -> Void) {
        let url = NetworkController.baseURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                completion(error)
                return
            }
            guard let data = data else {
                completion(NSError())
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let workoutJournalDictionaries = try decoder.decode([String: WorkoutJournal].self, from: data)
                let workoutJournal = workoutJournalDictionaries.map({ $0.value })
                self.workoutJournals = workoutJournal
                completion(nil)
            } catch {
                print(error)
                completion(error)
                return
            }
        }.resume()
    }
    
    
    

    
    // MARK: - Properties
    
 

}
