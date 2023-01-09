//
//  ReferenceView.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import SwiftUI

enum ViewOption: String, Identifiable, CaseIterable {
    case grouped, all
    
    var id: String { self.rawValue }
}


struct ReferenceView: View {
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(maximum: 250)), count: 2)
    @State var groupedNumbers: [Int: [Int]] = CTNumbers.groupedNumbers
    @State var ungroupedNumbers = CTNumbers.allNumbers.prefix(30)
    @State var viewOption: ViewOption = .grouped
    @State var searchText: String = ""
    
    
    let groupLabels: [Int: String] = [1: "Ones", 2: "Tens", 3: "Hundreds", 4:"Thousands"]
    
    var body: some View {
        NavigationStack {

            
            ScrollView {
                
                Picker("View Option", selection: $viewOption) {
                    ForEach(ViewOption.allCases) { option in
                        Text(option.rawValue.capitalized)
                            .tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 20, pinnedViews: .sectionHeaders) {
                    
                    switch viewOption {
                    case .grouped:
                        ForEach(groupedNumbers.sorted { $0.key < $1.key }, id: \.self.key) { group in
                            Section {
                                ForEach(group.value, id: \.self) { number in
                                    VStack {
                                        CipherShape(numbers: number.digits())
                                            .stroke(.primary, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                            .padding()
                                            .frame(maxWidth: .infinity, minHeight: 200)
                                            
                                        Text("\(number)")
                                            .font(.title2.bold())
                                            .frame(maxWidth: .infinity)
                                            .padding()
                                            .background {
                                                RoundedRectangle(cornerRadius: 8, style: .continuous)
                                                    .fill(.gray.gradient)
                                            }
                                    }
                                    .padding(5)
                                }
                            } header: {
                                Text(groupLabels[group.key, default: "Error"])
                                    .font(.title)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(.blue.gradient)
                                    .foregroundColor(.white)
                            }
                        }
                    case .all:
                        ForEach(ungroupedNumbers, id: \.self) { number in
                            VStack {
                                CipherShape(numbers: number.digits())
                                    .stroke(.primary, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                    .frame(maxWidth: 100, minHeight: 75)
                                    .padding()
                                Text("\(number)")
                                    .font(.title2)
                            }
                            .padding(5)
                        }
                        .searchable(text: $searchText)
                        
                    }
                    

                }
            }
            .navigationTitle("Reference")
        }
    }
}

struct ReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceView()
    }
}
