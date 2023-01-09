//
//  ContentView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var number = 1
    @State var trimAmount: CGFloat = .zero
    @State var redrawing: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                CipherShape(number: number)
                    .trim(from: .zero, to: trimAmount)
                    .stroke(redrawing ? .clear : .black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .frame(width: 200, height: 300, alignment: .center)
                    .padding(20)
                
                Text("\(number)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 4)
            }
            Button {
                
                redrawing = true
                trimAmount = .zero
                if number != 9 {
                    number += 1
                } else {
                    number = 1
                }
                redrawing = false
                withAnimation(.linear(duration: 0.75)) {
                    trimAmount = 1.0
                }
                
                
            } label: {
                Text("Next")
                    .font(.title)
                    .frame(maxWidth: .infinity, minHeight: 40)
                    
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
        }
        .onAppear {
            withAnimation(.linear(duration: 0.75)) {
                trimAmount = 1.0
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
