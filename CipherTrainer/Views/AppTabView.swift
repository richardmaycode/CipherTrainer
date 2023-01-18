//
//  TabView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import SwiftUI

enum TabOption: Int, Identifiable, Hashable, CaseIterable {
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
    
    @Binding var selection: TabOption
    
    var body: some View {
        TabView(selection: $selection) {
            CipherBuilder()
                .tabItem {
                    Label(TabOption.builder.label, systemImage: TabOption.builder.icon)
                }
                .tag(TabOption.builder)
            
            ReferenceView()
                .tabItem {
                    Label(TabOption.reference.label, systemImage: TabOption.reference.icon)
                }
                .tag(TabOption.reference)
            
            GameGalleryView()
                .tabItem {
                    Label(TabOption.game.label, systemImage: TabOption.game.icon)
                }
                .tag(TabOption.game)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(selection: .constant(.builder))
    }
}
