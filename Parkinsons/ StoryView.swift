//
//   StoryView.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import SwiftUI

struct StoryGeneratorView: View {
    @State private var prompt: String = ""
    @State private var response: String = ""
    
    var body: some View {
        VStack {
            Text("Reading/ Conversation Practice")
                .font(.headline)
                .padding()
            
            Text("Reading out loud from a paragraph or text can help with articulation, breath control, and pacing.")
                .padding()
            
            List {
                Text("Selection: Choose a topic of interest.")
                Text("Read Aloud: Read the paragraph out loud at a comfortable pace.")
                Text("Articulation: Focus on articulating each word clearly.")
                Text("Pacing: Maintain a steady pace, taking breaths as necessary but not rushing through the text.")
                Text("Expression: Try to incorporate some inflection and emotion, as you would in regular conversation.")
            }
            
            Text("Goal: To enhance your ability to speak more fluently in real-life situations, by practicing with complex sentences and different types of words.")
                .padding()
            
            TextField("Choose topic", text: $prompt)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Generate Story") {
                generateStory(prompt: prompt) { story in
                    self.response = story
                }
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(5)
            
            if !response.isEmpty {
                ScrollView {
                    Text(response)
                        .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 200)
                .border(Color.gray, width: 1)
                .padding()
            }
        }
    }
    
    func generateStory(prompt: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: "http://localhost:3002/v1/completions") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = ["topic": prompt]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion("Network request failed: \(error?.localizedDescription ?? "No error description")")
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                DispatchQueue.main.async {
                    completion("Error: \(httpResponse.statusCode)")
                }
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(StoryResponse.self, from: data) {
                DispatchQueue.main.async {
                    completion(decodedResponse.story.trimmingCharacters(in: .whitespacesAndNewlines))
                }
            } else {
                DispatchQueue.main.async {
                    completion("An error occurred")
                }
            }
        }.resume()
    }
}

struct StoryResponse: Codable {
    let story: String
}

struct StoryGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        StoryGeneratorView()
    }
}
