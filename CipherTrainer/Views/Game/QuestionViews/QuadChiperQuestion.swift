//
//  QuadChiperQuestion.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/12/23.
//

import SwiftUI

struct QuadChiperQuestion: View {
    
    let answer: Int
    let options: [Int]
    @Binding var guess: Int?
    
    @State var selectedIndex: Int = 100
    
    let twoColumns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: twoColumns, spacing: 20) {
                ForEach(Array(options.enumerated()), id: \.offset) { index, answer in
                    
                    answerCell(number: answer, picked: index == selectedIndex ? true : false)
                        .onTapGesture {
                            if index == selectedIndex {
                                selectedIndex = 100
                                guess = nil
                            } else {
                                selectedIndex = index
                                guess = answer
                            }
                        }
                }
            }
            
            Spacer()
            promptBlock
            Spacer()
        }
    }
    
    func answerCell(number: Int, picked: Bool) -> some View {
        VStack(spacing: 55) {
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
        .padding(40)
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
            Text("Pick the matching Cipher")
                .font(.system(.title3, design: .rounded))
            
            Text("\(answer)")
                .font(.system(.largeTitle, design: .rounded, weight: .heavy))
                .padding(8)
                .background {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.tertiary)
                    
                }
        }
    }
}

struct QuadChiperQuestion_Previews: PreviewProvider {
    static var previews: some View {
        QuadChiperQuestion(answer: 5423, options: [5423, 7810, 9132, 2538], guess: .constant(nil))
    }
}
