//
//  ContentView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/8/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: TabOption = .builder
    
    var body: some View {
        AppTabView(selection: $selection)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
