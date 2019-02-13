//
//  NetworkController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/5/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation


class NetworkController {
    
    static let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNTQ0MzM1NjUxLCJleHAiOjE1NzU4OTMyNTF9.uqd2OHBYkGQpwjLTPPiPWYkYOKlG7whQDFkk46xGXoE"
    
    static let baseURL = URL(string: "https://weightliftingjournallambda.herokuapp.com/")!
    
    
    // Post a workout journal
    static func postWorkoutJournal(journalObj: JournalsObj, completion: @escaping (Error) -> Void) {
        
        let authToken = NetworkController.token
        let postURL = baseURL.appendingPathComponent("workouts")
        var request = URLRequest(url: postURL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "content-type")
            request.addValue(authToken, forHTTPHeaderField: "Authorization")
        
        let journalObj: [String: Any] = ["date": journalObj.date, "region": journalObj.region, "journalID": journalObj.id]
        let json: Data
        
        do {
            json = try JSONSerialization.data(withJSONObject: journalObj, options: [])
            request.httpBody = json
        } catch {
            print("Can't create workout :(")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (_, response: URLResponse?, error: Error?) in
            if error != nil {
                print("error: \(String(describing: error))")
                return
            }
            if response != nil {
                print(response!)
                return
            }
        }
        dataTask.resume()
    }
    
    // Create a workout journal
    static func createWorkoutJournal(date: String, region: String, journalID: Int, completion: @escaping (Error?) -> Void) {
        
        let journalObj = JournalsObj(id: journalID, date: date, region: region)
        
        postWorkoutJournal(journalObj: journalObj, completion: completion)
        
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
