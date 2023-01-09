//
//  CipherShape.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/8/23.
//

import SwiftUI

enum num: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
}


struct CipherShape: Shape {
    
    let number: Int
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // base
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        switch number {
        case 1:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
        case 2:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.maxY * 0.33))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.maxY * 0.33))
        case 3:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.maxY * 0.33))
        case 4:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.maxY * 0.37))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        case 5:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.maxY * 0.33))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        case 6:
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.maxY * 0.33))
        case 7:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.maxY * 0.33))
        case 8:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.maxY * 0.33))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.maxY * 0.33))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        case 9:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.maxY * 0.33))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + rect.maxY * 0.33))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        default:
            break
        }
        
        
        return path
    }
}


struct CipherShape_Previews: PreviewProvider {
    
    struct Preview: View {
        @State var number: Int = 1
        
        var body: some View {
            VStack {
                CipherShape(number: number)
                    .stroke(.black, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .frame(width: 200, height: 300, alignment: .center)
                
                Text("\(number)")
                    .font(.largeTitle)
                Button {
                    if number != 9 {
                        number += 1
                    } else {
                        number = 1
                    }
                } label: {
                    Text("Next")
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
            //            Text("12".digits.reversed().map { String($0) }.joined())
        
    }
}
