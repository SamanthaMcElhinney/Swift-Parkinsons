//
//  LandingView.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import SwiftUI


struct LandingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                        Spacer() // Pushes content to the center
                        Text("Your path to better communication!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer() // Ensures the text stays centered
                    }
                    .padding(.bottom, 2)
                Text("Research shows prophylactic exercises can improve vocal loudness, articulation, and enhance speech intelligibility resulting in more effective communication and a better quality of life!")
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing, .top], 40)
                
                HStack(spacing: 20) {
                    FeatureIconView(imageName: "Phone", text: "Be understood")
                    FeatureIconView(imageName: "Convo", text: "Get Clarity")
                    FeatureIconView(imageName: "Pins", text: "Move Forward")
                }
                .padding()
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct FeatureIconView: View {
    var imageName: String
    var text: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
            Text(text)
                .foregroundColor(.white)
                .font(.headline)
        }
        .frame(width: 100, height: 120)
        .padding()
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
