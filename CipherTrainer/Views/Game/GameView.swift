//
//  GameView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/11/23.
//

import SwiftUI

enum QuestionType: Int, Identifiable {
    case singleSelectCipher, quadSelectCipher, singleGuessCipher, tweakCipher
    
    var id: Int { self.rawValue }
}

struct GameQuestion {
    let id: UUID = UUID()
    let questionType: QuestionType
    let options: [Int]
    let answer: Int
}


struct GameView: View {
    
    @State var gameStarted: Bool = false
    @State var previousGames: [Int] = [Int]()
    @State var currentQuestionIndex: Int = 0
    @State var changingQuestions: Bool = false
    
    @State var questions: [GameQuestion] = [GameQuestion]()
    @State var loading: Bool = false
        
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if gameStarted && !loading {
                        ZStack {
                            let currentQuestion = questions[currentQuestionIndex]
                            switch currentQuestion.questionType {
                            case .quadSelectCipher:
                                QuadChiperQuestion(answer: currentQuestion.answer, options: currentQuestion.options)
                            case .singleSelectCipher:
                                SingleCipherQuestion(answer: currentQuestion.answer, options: currentQuestion.options)
                            default:
                                Text("Weird Format")
                            }
                            
                            Color.white.opacity(changingQuestions ? 1 : 0)
                                .animation(.linear(duration: 1), value: changingQuestions)
                        }

                        Button(action: { scoreRound() }) {
                            Text("Check Answer")
                                .font(.system(.title, design: .rounded, weight: .heavy))
                                .frame(maxWidth: .infinity, minHeight: 40)
                            
                        }
                        .tint(.teal)
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal, 30)
                    }
                    else if !loading {
                        Text("Details:")
                        Text("This is a game that acts as a game and is a great way to learn ciphers using the game.")
                        
                        Text("Previous Games")
                        if previousGames.isEmpty {
                            Text("No previous games found, start playing to see stats")
                        } else {
                            // add previous games view
                        }
                        
                        Spacer()
                        Button(action: { createGame() }) {
                            Text("Start Game")
                                .font(.system(.title, design: .rounded, weight: .heavy))
                                .frame(maxWidth: .infinity, minHeight: 40)
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.horizontal, 30)
                    }

                    
                }
                .navigationTitle(gameStarted ? "" : "Practice Ciphers")
                .navigationBarTitleDisplayMode(gameStarted ? .inline : .large)
                .toolbar {
                    if gameStarted && !loading {
                        ToolbarItem(placement: .principal) {
                            VStack(spacing: 2) {
                                Text("\(currentQuestionIndex + 1) / \(questions.count)")
                                    .font(.system(.title2, design: .rounded, weight: .heavy))
                                
                               
                            }
                        }

                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: { gameStarted = false }) {
                                Label("End Game", systemImage: "arrowshape.left")
                                    .font(.system(.title2, design: .rounded, weight: .heavy))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .toolbarBackground(Color.pink, for: .navigationBar)
                .toolbar(.visible, for: .navigationBar)
                if loading {
                    LoadingSymbol()
                }
            }

        }
    }
    
    func createGame() {
        loading = true
        var rounds = [GameQuestion]()
        
        for _ in 1...10 {
            var options = [Int.random(in: 1...9999), Int.random(in: 1...9999), Int.random(in: 1...9999), Int.random(in: 1...9999)]
            options.shuffle()
            
            let round = GameQuestion(questionType: Bool.random() ? .quadSelectCipher : .singleSelectCipher, options: options, answer: options.randomElement()!)
            
            rounds.append(round)
        }
        
        questions = rounds
        gameStarted = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            loading = false
        }
    }
    
    
    func scoreRound() {
        changingQuestions = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            if (currentQuestionIndex + 1) == questions.count {
                gameStarted = false
            } else {
                currentQuestionIndex += 1
            }
            changingQuestions = false
        }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
