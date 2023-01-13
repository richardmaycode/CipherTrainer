//
//  KeyPadGrid.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/12/23.
//

import SwiftUI

struct KeyPadGrid: View {
    
    @Binding var selections: String
    
    var body: some View {
        VStack {
            
            Text(selections)
                .font(.system(.title, design: .rounded, weight: .heavy))
                .frame(maxWidth: .infinity, minHeight: 50)
                
                .background {
                    RoundedRectangle(cornerRadius: 5)
                    
                        .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                .offset(x: 3, y: 3)
                        }
                }
                .padding(.horizontal, 40)
            
            Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                GridRow {
                    key(option: "1")
                    key(option: "2")
                    key(option: "3")
                }
                
                
                GridRow {
                    key(option: "4")
                    key(option: "5")
                    key(option: "6")
                }
                
                GridRow {
                    key(option: "7")
                    key(option: "8")
                    key(option: "9")
                }
                
                GridRow {
                    
                    Text("")
                    
                    key(option: "0")
                    
                    
                    Button(action: { selections.removeLast() }) {
                        Image(systemName: "delete.left")
                    }
                    .buttonStyle(.plain)
                    
                }
            }
            
            .font(.system(.largeTitle, design: .rounded, weight: .heavy))
            .buttonStyle(.borderedProminent)
        .padding(.vertical)
        }
    }
    
    @ViewBuilder
    func key(option: String) -> some View {
        Button {
            if selections.count < 4 {
                selections += option
            }
        } label: {
            Text(option)
                .frame(minWidth: 30, minHeight: 40)
        }
        
        

    }
    
}

struct KeyPadGrid_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State var selections: String = ""
        
        var body: some View {
            KeyPadGrid(selections: $selections)
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
