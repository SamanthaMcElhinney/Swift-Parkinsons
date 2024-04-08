//
//  PhraseResponse.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/8/24.
//

import Foundation

struct PhraseResponse: Codable {
    let phrases: [String]
}

func generatePhrases(topic:String, completion:@escaping([String]) -> Void ) {
    guard let url = URL(string: "http://localhost:3002/v1/chat/completions") else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let body: [String: Any] = ["topic": topic]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
    URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Network request failed: \(error?.localizedDescription ?? "No error description")")
                return
            }

            if let phraseResponse = try? JSONDecoder().decode(PhraseResponse.self, from: data) {
                DispatchQueue.main.async {
                    completion(phraseResponse.phrases)
                }
            } else {
                print("Failed to decode response")
            }
        }.resume()
}
