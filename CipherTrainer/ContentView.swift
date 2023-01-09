//
//  ContentView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var number = 1
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                CipherShape(number: number)
                    .stroke(.black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .frame(width: 200, height: 300, alignment: .center)
                    .padding(20)
                
                Text("\(number)")
                    .font(.largeTitle)
            }
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 4)
            }
            Button {
                if number != 9 {
                    number += 1
                } else {
                    number = 1
                }
            } label: {
                Text("Next")
                    .font(.title)
                    .frame(maxWidth: .infinity, minHeight: 40)
                    
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
