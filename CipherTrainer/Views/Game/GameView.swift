//
//  GameView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/11/23.
//

import SwiftUI

struct GameView: View {
    
    @State var gameStarted: Bool = true
    @State var previousGames: [Int] = [Int]()
    @State var guessText: String = ""
    
    let promptTitle: String = "9232"
    let promptSubtitle: String = "Pick the matching Cipher"
    
    let twoColumns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            VStack {
                if gameStarted {
                    
                    Text("Question 1")
                        .font(.system(.largeTitle, design: .rounded))
                        
                    
                    LazyVGrid(columns: twoColumns, spacing: 50) {

                        guessableCipher(number: 5032, picked: true)
                        
                        guessableCipher(number: 4302, picked: false)
                            
                        guessableCipher(number: 678, picked: false)
                            
                        guessableCipher(number: 9232, picked: false)
                            
                        
                        
                    }
                    
                    
                    
                    Spacer()
                    promptBlock
                    Spacer()
                    

                    
                    
                    

                    
                    Button(action: { }) {
                        Text("Submit")
                            .font(.system(.title, design: .rounded, weight: .heavy))
                            .frame(maxWidth: .infinity, minHeight: 40)
                        
                    }
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal, 30)
                }
                else {
                    Text("Details:")
                    Text("This is a game that acts as a game and is a great way to learn ciphers using the game.")
                    
                    Text("Previous Games")
                    if previousGames.isEmpty {
                        Text("No previous games found, start playing to see stats")
                    } else {
                        // add previous games view
                    }
                    
                    Spacer()
                    Button(action: { gameStarted = true }) {
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
                if gameStarted {
                    ToolbarItem(placement: .principal) {
                        VStack(spacing: 2) {
                            Text("0 / 10")
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
        }
    }
    
    
    @ViewBuilder func guessableCipher(number: Int, picked: Bool) -> some View {
        VStack(spacing: 30) {
            
            
            
            CipherShape(numbers: number.digits())
                .stroke(.black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                
                .frame(width: 100, height: 125)
                .background {
                    CipherShape(numbers: number.digits())
                        .stroke(.gray, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    
                        .frame(width: 100, height: 125)
                        .offset(x: 3, y: 3)
                }
//                .offset(x: picked ? 3 : 0, y: picked ? 3 : 0)
                
            
            Image(systemName: picked ? "checkmark.circle.fill" : "circle")
                .font(.title)
                .foregroundColor(picked ? .teal : .black)
                .background {
                    Image(systemName: "circle")
                        .font(.title.bold())
                        .foregroundColor(.gray)
                        .offset(x: 2, y: 2)
                }
        }
        .padding(30)
        .background {
            RoundedRectangle(cornerRadius: 5)
                
                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(picked ? .teal : .gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .offset(x: 3, y: 3)
                }
        }
    }
    
    
    var promptBlock: some View {
        VStack(spacing: 10) {
            Text(promptSubtitle)
                .font(.system(.title3, design: .rounded))
            
            Text(promptTitle)
                .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.tertiary)
                    
                }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
