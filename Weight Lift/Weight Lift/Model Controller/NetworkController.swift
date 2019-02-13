//
//  NetworkController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/5/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation


class NetworkController {
    
   
    
    static let baseURL = URL(string: "https://weightliftingjournallambda.herokuapp.com/")!
    
    
    // Create a workout journal
        static func createWorkoutJournal() {
            var request = URLRequest(url: baseURL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "content-type")
    
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
