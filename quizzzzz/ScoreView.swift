//
//  ScoreView.swift
//  quizzzzz
//
//  Created by FAITH CHONG RUI EN stu on 15/6/22.
//

import SwiftUI

struct ScoreView: View {
    
    var totalQuestions: Int
    var score: Int
    @State var scoreSize = 0.1
    var correctScore = false
//    var questions: Array<Any>
    
    var body: some View {
        VStack {
            Text("game over")
                .padding()
                .font(.largeTitle)
            Text("score: \(score)/\(totalQuestions)")
                .padding()
                .font(.largeTitle)
                .foregroundColor(correctScore ? .green : .red)
                .onAppear {
                    withAnimation(.easeInOut(duration: 3)) {
                        scoreSize = 1
                    }
                }
                .onDisappear {
                    scoreSize = 0
                }

//            Button {
//
//            } label: {
//                Text("play again?")
//                    .padding()
//                    .foregroundColor(.blue)
//            }
            Text("_swipe up to play again_")
                .padding()
                .foregroundColor(.blue)
        }
        
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(totalQuestions: 3, score: 0, correctScore: true)
    }
}
