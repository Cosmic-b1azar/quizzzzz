//
//  ContentView.swift
//  quizzzzz
//
//  Created by FAITH CHONG RUI EN stu on 15/6/22.
//

import SwiftUI

struct ContentView: View {
    var questions = [Question(questionText: "what's the day",
                              option1: "mon",
                              option2: "tue",
                              option3: "wed",
                              option4: "thur",
                             correctOption: 4),
                     Question(questionText: "what is the best food",
                              option1: "ramen",
                              option2: "chicken rice",
                              option3: "nuggets",
                              option4: "ice cream",
                             correctOption: 1),
                     Question(questionText: "where am i",
                              option1: "at home",
                              option2: "in the garden",
                              option3: "at the door",
                              option4: "behind you",
                             correctOption: 4)
    ]

    @State var currentQuestion = 0
    
    @State var isAlertShown = false
    @State var isCorrect = false
    
    @State var isScoreShown = false
    @State var correctAnswers = 0
    @State var correctscore = false
    
    var body: some View {
            
        VStack {
            Text(questions[currentQuestion % questions.count].questionText)
                .frame(width: 400)
                .padding()
                .font(.largeTitle)
                .background(.white)
            HStack {
                VStack {
                    Button {
                        isCorrect = false
                        alert()
                    } label: {
                        Text(questions[currentQuestion % questions.count].option1)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    Button {
                        isCorrect = true
                        alert()
                        correctAnswers += 1
                        if correctAnswers == questions.count {
                            correctscore = true
                        }
                    } label: {
                        Text(questions[currentQuestion % questions.count].option2)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.red)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
                VStack {
                    Button {
                        isCorrect = false
                        alert()
                    } label: {
                        Text(questions[currentQuestion % questions.count].option3)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .background(.yellow)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    Button {
                        isCorrect = false
                        alert()
                    } label: {
                        Text(questions[currentQuestion % questions.count].option4)
                            .font(.largeTitle)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.white)
                            .background(.green)
                            .cornerRadius(20)
                    }
                }
            }
        }
        
        .sheet(isPresented: $isScoreShown, onDismiss: {
            correctAnswers = 0
        }, content: {
            ScoreView(totalQuestions: currentQuestion, score: correctAnswers, correctScore: correctscore)
        })
        
        .alert(isCorrect ? "correct" : "wrong", isPresented: $isAlertShown) {
            Button("ok") {
                if currentQuestion == questions.count {
                    isScoreShown = true
                }
                currentQuestion += 1
            }
        }

        }
    func alert() {
        isAlertShown = true
    }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
