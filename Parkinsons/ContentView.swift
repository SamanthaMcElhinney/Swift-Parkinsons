//
//  ContentView.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppState
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            NavigationView {
                VStack {
                    switch appState.selectedExercise {
                    case .vocal:
                        CountdownView()
                    case .functional:
                        FunctionalPhrasesView()
                    case .reading:
                        StoryView()
                    case .none:
                        LandingView()
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Parkinson's AI")
                            .font(.headline)
                            .scaledToFit()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Picker("Select an option", selection: $appState.selectedExercise) {
                            Text("Select").tag(ExerciseType?.none)
                            ForEach(ExerciseType.allCases) { exercise in
                                Text(exercise.rawValue).tag(exercise as ExerciseType?)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .foregroundColor(.white)
                    }
                }
                .background(Color.black) // Set the background color to black
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(appState: AppState())
        }
    }
