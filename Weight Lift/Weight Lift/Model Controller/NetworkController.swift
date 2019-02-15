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
    static func createWorkoutJournal(date: String, region: String,completion: @escaping (Error?) -> Void) {
        
        let newWorkoutJournal = WorkoutJournal(date: date, region: region)
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
        
    }
    
    // Get a workout journal
    static func getWorkoutJournal() {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
    }
    
    // Update a workout journal
    static func updateWorkoutJournal() {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
    }
    
    // Delete a workout journal
    static func deleteWorkoutJournal() {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
    }

    
    // MARK: - Properties
    
    private(set) var journalObjs: [JournalsObj] = []
    private (set) var exerciseCard: [ExerciseCard] = []
    

}
