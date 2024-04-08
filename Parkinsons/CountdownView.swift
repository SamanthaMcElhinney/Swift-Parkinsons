//
//  CountdownView.swift
//  Parkinsons
//
//  Created by Samantha McElhinney on 4/7/24.
//

import SwiftUI

struct CountdownView: View {
    @State private var countdown: Int = 10
    @State private var timerRunning: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("Countdown Timer")
                .font(.headline)
            Text("\(countdown)")
                .font(.largeTitle)
                .padding()

            // Start and Stop button
            Button(timerRunning ? "Stop" : "Start") {
                timerRunning.toggle()
                if countdown == 0 { // Reset the countdown if it has reached 0
                    countdown = 10
                }
            }
            .padding()
            .background(timerRunning ? Color.red : Color.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
        }
        .onReceive(timer) { _ in
            if timerRunning && countdown > 0 {
                countdown -= 1
            } else if countdown == 0 {
                timerRunning = false // Stop the timer when it reaches 0
            }
        }
        .onDisappear {
            timer.upstream.connect().cancel() // Stop the timer if the view disappears to prevent memory leaks
        }
    }
}

//#Preview {
//    CountdownView()
//}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
