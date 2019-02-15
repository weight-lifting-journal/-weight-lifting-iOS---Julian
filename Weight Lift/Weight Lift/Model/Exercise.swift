//
//  Exercise.swift
//  Weight Lift
//
//  Created by Julian A. Fordyce on 2/6/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import Foundation

class WorkoutJournal: Equatable, Codable {
    
    let identifier: String
    let date: String
    let region: String
    let exerciseCards: [WorkoutJournal.ExerciseCard]
    
    init(date: String, identifier: String = UUID().uuidString, region: String, exerciseCards: [WorkoutJournal.ExerciseCard] = []) {
        
        self.date = date
        self.identifier = date
        self.region = region
        self.exerciseCards = exerciseCards
}

struct ExerciseCard: Equatable, Codable {
    let journalID: String
    let name: String
    let reps: String
    let sets: String
    let weight: String

    init(journalID: String, name: String, reps: String, sets: String, weight: String ) {
        self.journalID = journalID
        self.name = name
        self.reps = reps
        self.sets = sets
        self.weight = weight
    }
}
    static func == (lhs: WorkoutJournal, rhs: WorkoutJournal) -> Bool {
        return lhs.identifier == rhs.identifier && rhs.identifier == lhs.identifier
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let date = try container.decode(String.self, forKey: .date)
        let identifier = try container.decode(String.self, forKey: .identifier)
        let region = try container.decode(String.self, forKey: .region)
        
        let exerciseCardsDictionaries = try container.decodeIfPresent([String: ExerciseCard].self, forKey: .exerciseCards)
        let exerciseCards = exerciseCardsDictionaries?.compactMap({ $0.value }) ?? []
        
        self.date = date
        self.identifier = identifier
        self.region = region
        self.exerciseCards = exerciseCards
    }
}







