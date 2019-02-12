//
//  NetworkController.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/5/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation


class NetworkController {
    
    private (set) var journalObj: [JournalsObj] = []
    private (set) var exerciseCard: [ExerciseCard] = []
    
    static let baseURL = URL(string: "https://weightliftingjournallambda.herokuapp.com/")!
    
    
    static func getWorkouts() {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
    }
    
    
    static func createWorkoutJournal(withJournalsObj JournalsObj: [JournalsObj])-> JournalsObj {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "content-type")
        
    }
    
    

}
