//
//  TabView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import SwiftUI

enum Tab: Int, Identifiable, Hashable, CaseIterable {
    case builder, reference, game
    
    var id: Int { self.rawValue }
    
    var label: String {
        switch self {
        case .builder:
            return "Builder"
        case .reference:
            return "Reference"
        case .game:
            return "Game"
        }
    }
    
    var icon: String {
        switch self {
        case .builder:
            return "point.3.connected.trianglepath.dotted"
        case .reference:
            return "doc.plaintext"
        case .game:
            return "gamecontroller"
        }
    }
    

}


struct AppTabView: View {
    
    @State var selection: Tab = .builder
    
    var body: some View {
        TabView(selection: $selection) {
            CipherBuilder()
                .tabItem {
                    Label(Tab.builder.label, systemImage: Tab.builder.icon)
                }
            ReferenceView()
                .tabItem {
                    Label(Tab.reference.label, systemImage: Tab.reference.icon)
                }
            
            LoadingSymbol()
                .tabItem {
                    Label(Tab.game.label, systemImage: Tab.game.icon)
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
