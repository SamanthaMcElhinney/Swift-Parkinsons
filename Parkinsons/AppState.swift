//
//  AppState.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import Foundation

class AppState: ObservableObject {
    @Published var selectedExercise: ExerciseType? = nil
}
