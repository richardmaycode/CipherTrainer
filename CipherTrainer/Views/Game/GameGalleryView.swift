//
//  GameGalleryView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/11/23.
//

import SwiftUI

enum QuestionType: Int, Identifiable {
    case singleSelectCipher, quadSelectCipher, singleGuessCipher, tweakCipher
    
    var id: Int { self.rawValue }
}

struct GameQuestion: Identifiable {
    let id: UUID = UUID()
    let questionType: QuestionType
    let options: [Int]
    let answer: Int
    var outcome: Bool?
    
    var outcomeLabel: (title: String, image: String, color: Color) {
        switch self.outcome {
        case true:
            return ("Correct", "checkmark.circle.fill", .green)
        case false:
            return ("Incorrect", "xmark.circle.fill", .red)
        default:
            return ("Pending", "minus.circle.fill", .gray)
        }
    }
}


struct GameGalleryView: View {
    
    @State var gameStarted: Bool = false
    @State var previousGames: [Int] = [Int]()
    @State var currentQuestionIndex: Int = 0
    @State var changingQuestions: Bool = false
    
    @State var questions: [GameQuestion] = [GameQuestion]()
    @State var outcomes: [Bool] = [Bool]()
    @State var guess: Int? = nil
    @State var loading: Bool = false
    @State var showingScores: Bool = false
        
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if !loading {
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
                        .padding([.bottom], 10)
                    }

                    
                }
                .navigationTitle("Practice Ciphers")
                .fullScreenCover(isPresented: $gameStarted) {
                    GameView(questions: questions)
                }



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
            
            let round = GameQuestion(questionType: Bool.random() ? .quadSelectCipher : .singleSelectCipher, options: options, answer: options.randomElement()!, outcome: nil)
            
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
        guard let guess = guess else { return }
        
        questions[currentQuestionIndex].outcome =  guess == questions[currentQuestionIndex].answer
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
            if (currentQuestionIndex + 1) == questions.count {
                gameStarted = false
            } else {
                currentQuestionIndex += 1
            }
            self.guess = nil
            changingQuestions = false
        }
    }
    
}

struct GameGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GameGalleryView()
    }
}
