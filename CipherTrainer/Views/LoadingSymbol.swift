//
//  LoadingSymbol.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/11/23.
//

import SwiftUI

struct LoadingSymbol: View {
    
    @State var rotation: Double = 0
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .stroke(.teal ,style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .frame(width: 100)
                    .background {
                        Circle()
                            .stroke(.secondary ,style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                            .offset(x: 3, y: 3)
                    }
                    .padding(.vertical, 30)
                    .overlay {
                        Circle()
                            .stroke(.primary, lineWidth: 4)
                            .frame(width: 25)
                            .background {
                                Circle()
                                    .fill(.teal)
                            }
                            .background {
                                Circle()
                                    .stroke(.secondary ,style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                                    .offset(x: 3, y: 3)
                            }
                            .offset(x: 0, y: -50)
                            .rotationEffect(Angle(degrees: rotation))
                    }
                
                Text("Loading...")
                    .font(.system(.title, design: .rounded, weight: .heavy))
                    .padding([.horizontal, .bottom], 30)
            }
                
            

                
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.primary, lineWidth: 5)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.secondary, lineWidth: 5)
                        .offset(x: 3, y: 3)
                }
                
                
                
        }
        
        .onAppear {
            withAnimation(.spring(response: 1, dampingFraction: 1.4).repeatForever(autoreverses: false)) {
                rotation = 360
            }
        }
    }
}

struct LoadingSymbol_Previews: PreviewProvider {
    static var previews: some View {
        LoadingSymbol()
    }
}
