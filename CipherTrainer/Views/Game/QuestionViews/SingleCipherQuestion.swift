//
//  SingleCipherQuestion.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/13/23.
//

import SwiftUI

struct SingleCipherQuestion: View {
    
    let answer: Int
    let options: [Int]
    
    @Binding var guess: Int?
    
    var body: some View {
        VStack {
            CipherShape(numbers: answer.digits())
                .stroke(.black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
            
                .frame(width: 200, height: 250)
                .background {
                    CipherShape(numbers: answer.digits())
                        .stroke(.gray, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    
                        .frame(width: 200, height: 250)
                        .offset(x: 3, y: 3)
                }
                .padding(40)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                    
                        .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                .offset(x: 3, y: 3)
                        }
                }
            VStack(spacing: 25) {
                ForEach(Array(options.enumerated()), id: \.offset) { index, option in
                    Text("\(option)")
                        .font(.system(.title, design: .rounded, weight: .heavy))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            guess = option
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 60, style: .continuous)
                                .fill(option == guess ? .teal : .clear)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 60)
                            
                                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                            
                                .background {
                                    RoundedRectangle(cornerRadius: 60)
                                        .stroke(.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .offset(x: 3, y: 3)
                                }
                                
                        }
                        .padding(.horizontal, 40)
                        
                }
            }
            .padding(.top, 30)
        }
    }
}

struct SingleCipherQuestion_Previews: PreviewProvider {
    static var previews: some View {
        SingleCipherQuestion(answer: 7593, options: [9823, 7593, 1034, 4827], guess: .constant(nil))
    }
}
