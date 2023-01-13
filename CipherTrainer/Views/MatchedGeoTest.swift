//
//  MatchedGeoTest.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/12/23.
//

import SwiftUI

struct MatchedGeoTest: View {
    
    @Namespace var namespace
    @State var expanded: Bool = false
    @State var cRadius: CGFloat = 200
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                if !expanded {
                    RoundedRectangle(cornerRadius: 50)
                        
                        .matchedGeometryEffect(id: "one", in: namespace)
                        .frame(width: 50, height: 50, alignment: .center)
                        .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
                    
                    RoundedRectangle(cornerRadius: 50)
                    
                        .matchedGeometryEffect(id: "two", in: namespace)
                        .frame(width: 50, height: 50, alignment: .center)
                        .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
                        
                    
//                    Circle()
//                        .foregroundColor(.red)
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "One", in: namespace)
//                        .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
//
//                    Circle()
//                        .foregroundColor(.red)
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "Two", in: namespace)
//                        .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
//
//                    Circle()
//                        .foregroundColor(.red)
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "Three", in: namespace)
//                        .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
//
//                    Rectangle()
//                        .foregroundColor(.red)
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "Four", in: namespace)
//                        .cornerRadius(200)
//                        .position(x: proxy.frame(in: .global).midX, y: proxy.frame(in: .global).midY)
                } else {
                    RoundedRectangle(cornerRadius: 25)
                        .matchedGeometryEffect(id: "one", in: namespace)
                        .frame(width: 150, height: 150, alignment: .center)
                        .position(x: proxy.frame(in: .global).minX + 110, y: proxy.frame(in: .global).minY + 135)
                    
                    RoundedRectangle(cornerRadius: 25)
                        .matchedGeometryEffect(id: "two", in: namespace)
                        .frame(width: 150, height: 150, alignment: .center)
                        .position(x: proxy.frame(in: .global).maxX - 110, y: proxy.frame(in: .global).minY + 135)
                        
                        
//                    Color.red
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "One", in: namespace)
//                        .position(x: proxy.frame(in: .global).minX + 75, y: proxy.frame(in: .global).minY + 125)
//
//                    Color.red
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "Two", in: namespace)
//                        .position(x: proxy.frame(in: .global).maxX - 75, y: proxy.frame(in: .global).minY + 125)
//
//                    Color.red
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "Three", in: namespace)
//                        .position(x: proxy.frame(in: .global).maxX - 75, y: proxy.frame(in: .global).maxY - 125)
//
//                    Rectangle()
//                        .foregroundColor(.red)
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .matchedGeometryEffect(id: "Four", in: namespace)
//                        .cornerRadius(8)
//                        .position(x: proxy.frame(in: .global).minX + 75, y: proxy.frame(in: .global).maxY - 125)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onTapGesture {
                withAnimation {
                    expanded.toggle()
                    
                }
            }
        }
        .ignoresSafeArea()

    }

}

struct MatchedGeoTest_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeoTest()
    }
}
