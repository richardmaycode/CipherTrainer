//
//  CipherBuilder.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import SwiftUI

struct CipherBuilder: View {
    
    @State var number = 0
    @State var requestText: String = ""
    @State var trimAmount: CGFloat = 1.0
    @State var redrawing: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                VStack {
                    CipherShape(numbers: number.digits())
                        .trim(from: .zero, to: trimAmount)
                        .stroke(redrawing ? .clear : .black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                        .frame(width: 200, height: 225, alignment: .center)
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
                
                Spacer()
                
                TextField("Number", text: $requestText)
                    .keyboardType(.numberPad)
                    .scrollDismissesKeyboard(.immediately)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color(uiColor: .secondarySystemFill), lineWidth: 3)
                        
                    }
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                
                Button {
                    guard requestText.isNumber else { return }
                    
                    redrawing = true
                    trimAmount = .zero
                    
                    number = Int(requestText) ?? 0
                    
                    redrawing = false
                    withAnimation(.linear(duration: 1.50)) {
                        trimAmount = 1.0
                    }
                    
                    
                } label: {
                    Text("Draw Cipher")
                        .font(.title)
                        .frame(maxWidth: .infinity, minHeight: 40)
                    
                }
                .buttonStyle(.borderedProminent)
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Cipher Builder")
        }
    }
}

struct CipherBuilder_Previews: PreviewProvider {
    static var previews: some View {
        CipherBuilder()
    }
}
