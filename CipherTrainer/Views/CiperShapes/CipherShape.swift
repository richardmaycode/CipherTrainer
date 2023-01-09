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
    
    let numbers: [Int]
    
    func path(in rect: CGRect) -> Path {
        
        let adjustment = rect.maxY * 0.33
        var path = Path()
        // base
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        for (index, number) in numbers.reversed().enumerated() {
            switch index {
                
            // ones place
            case 0:
                switch number {
                case 1:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
                case 2:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
                case 3:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
                case 4:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                case 5:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
                case 6:
                    path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
                case 7:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
                case 8:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                case 9:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
                default:
                    break
                }
                
            // tens place
            case 1:
                switch number {
                case 1:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                case 2:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + adjustment))
                case 3:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + adjustment))
                case 4:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                case 5:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
                case 6:
                    path.move(to: CGPoint(x: rect.minX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + adjustment))
                case 7:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + adjustment))
                case 8:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                case 9:
                    path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
                default:
                    break
                }
                
            // hundredths place
            case 2:
                switch number {
                case 1:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                    
                case 2:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - adjustment))
                case 3:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - adjustment))
                case 4:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                case 5:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                case 6:
                    path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - adjustment))
                case 7:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - adjustment))
                case 8:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                case 9:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                default:
                    break
                }
                
            // thousandsth place
            case 3:
                switch number {
                case 1:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                    
                case 2:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - adjustment))
                case 3:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - adjustment))
                case 4:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                case 5:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                case 6:
                    path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - adjustment))
                case 7:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - adjustment))
                case 8:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                case 9:
                    path.move(to: CGPoint(x: rect.midX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - adjustment))
                    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
                    path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
                default:
                    break
                }
                
            // ignore bigger numbers
            default:
                break
            }
        }
        
        
        
//        switch number {
//        case 1:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//
//        case 2:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
//        case 3:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
//        case 4:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY + rect.maxY * 0.37))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        case 5:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        case 6:
//            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
//        case 7:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
//        case 8:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//        case 9:
//            path.move(to: CGPoint(x: rect.midX, y: rect.minY + adjustment))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + adjustment))
//            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
//        default:
//            break
//        }
        
        
        return path
    }
}


struct CipherShape_Previews: PreviewProvider {
    
    struct Preview: View {
        @State var number: Int = 9265
        
        var body: some View {
            VStack {
                CipherShape(numbers: number.digits())
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
