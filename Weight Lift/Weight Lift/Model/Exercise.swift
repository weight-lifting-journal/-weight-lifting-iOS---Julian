//
//  Exercise.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/6/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

struct Exercise: Codable {
    let journalsObj: [JournalsObj]
    let exerciseCards: [ExerciseCard]
}

struct ExerciseCard: Codable {
    let journalID: Int
    let name: String
    let reps: String
    let sets: Int
    let weight: String
    
    enum CodingKeys: String, CodingKey {
        case journalID = "journalId"
        case name
        case reps
        case sets
        case weight
    }
}

struct JournalsObj: Codable {
    let id: Int
    let date: String
    let region: String
    
    init(id: Int, date: String, region: String) {
        self.id = id
        self.date = date
        self.region = region
    }
}
