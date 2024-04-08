//
//  Header.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//


import SwiftUI

struct HeaderView: View {
    @Binding var selectedExercise: ExerciseType?
    
    var body: some View {
        HStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(height: 70)
            VStack(alignment: .leading) {
                Text("Parkinson's AI")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 150)
            }
            Spacer()
            Picker("Select an option", selection: $selectedExercise) {
                Text("Select").tag(ExerciseType?.none).foregroundColor(.white)
                ForEach(ExerciseType.allCases) { exercise in
                    Text(exercise.rawValue).tag(exercise as ExerciseType?).foregroundColor(.white) // It won't affect the menu items
                }
            }
            .pickerStyle(MenuPickerStyle())
            .foregroundColor(.white) // Attempt to set the picker label color
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(selectedExercise: .constant(nil))
            .background(Color.black) // Set a background color to see white text clearly in previews
            .previewLayout(.sizeThatFits)
    }
}

