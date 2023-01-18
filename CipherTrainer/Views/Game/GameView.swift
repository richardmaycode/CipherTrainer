//
//  GameView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/17/23.
//

import SwiftUI

struct GameView: View {
    
    @State var changingQuestions: Bool = false
    @State var currentQuestionIndex: Int = 0
    @State var questions: [GameQuestion]
    @State var guess: Int? = nil
    @State var showingScores: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    let currentQuestion = questions[currentQuestionIndex]
                    switch currentQuestion.questionType {
                    case .quadSelectCipher:
                        QuadChiperQuestion(answer: currentQuestion.answer, options: currentQuestion.options, guess: $guess)
                    case .singleSelectCipher:
                        SingleCipherQuestion(answer: currentQuestion.answer, options: currentQuestion.options, guess: $guess)
                    default:
                        Text("Weird Format")
                    }
                    
                    Button(action: {
                        // scoreRound()
                        
                    }) {
                        Text("Check Answer")
                            .font(.system(.title, design: .rounded, weight: .heavy))
                            .frame(maxWidth: .infinity, minHeight: 40)
                        
                    }
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal, 30)
                    
                }
                Color.white.opacity(changingQuestions ? 1 : 0)
                    .animation(.linear(duration: 1), value: changingQuestions)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Button {
                        showingScores = true
                    } label: {
                        Text("\(currentQuestionIndex + 1) / \(questions.count)")
                            .font(.system(.title2, design: .rounded, weight: .heavy))
                    }
                    
                    
                    
                    
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { }) {
                        Label("End Game", systemImage: "arrowshape.left")
                            .font(.system(.title2, design: .rounded, weight: .heavy))
                    }
                    .buttonStyle(.plain)
                }
            }
            .sheet(isPresented: $showingScores) {
                NavigationStack {
                    List {
                        ForEach(Array(questions.enumerated()), id: \.offset) { index, question in
                            
                            HStack {
                                Text("Quesiton \(index + 1)")
                                Spacer()
                                
                                Label(question.outcomeLabel.title, systemImage: question.outcomeLabel.image)
                                    .foregroundColor(question.outcomeLabel.color)
                            }
                        }
                    }
                    
                }
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button(action: { showingScores = false }) {
                            Text("Dismiss")
                        }
                    }
                }
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                
                
            }
        }
        


    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(questions: [GameQuestion]())
    }
}



