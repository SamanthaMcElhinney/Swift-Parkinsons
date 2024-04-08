//
//  ExerciseType.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import Foundation

enum ExerciseType: String, CaseIterable, Identifiable {
    case vocal = "Vocal Exercises"
    case functional = "Functional Phrases"
    case reading = "Reading Paragraphs"
    var id: String { self.rawValue }
}
