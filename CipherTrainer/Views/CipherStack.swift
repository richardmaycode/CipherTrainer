//
//  CipherStack.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/10/23.
//

import SwiftUI

struct CipherStack: View {
    
    let number: Int

    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            VStack {
                CipherShape(numbers: number.digits())
                    .stroke(.black, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .frame(width: 50, height: 60, alignment: .center)
                    .padding(20)
                
                Text("\(number)")
                    .font(.headline)
                    .foregroundColor(.black)
                
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .shadow(radius: 4)
            }
        }
        .frame(width: 100, height: 100, alignment: .center)
    }
}

struct CipherStack_Previews: PreviewProvider {
    static var previews: some View {
        CipherStack(number: 23)
    }
}
