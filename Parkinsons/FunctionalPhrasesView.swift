//
//  FunctionalPhrasesView.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import SwiftUI

struct FunctionalPhrasesView: View {
    @State private var topic: String = ""
    @State private var phrases: [String] = []

    var body: some View {
        VStack {
            TextField("Choose your topic", text: $topic)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
            
            Button("Generate Phrases") {
                generatePhrases(topic: topic) { fetchedPhrases in
                    self.phrases = fetchedPhrases
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
            
            List(phrases, id: \.self) { phrase in
                Text(phrase)
            }
        }
        .padding()
    }
}

struct FunctionalPhrasesView_Previews: PreviewProvider {
    static var previews: some View {
        FunctionalPhrasesView()
    }
}
