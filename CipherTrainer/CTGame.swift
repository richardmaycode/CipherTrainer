//
//  CTGame.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/17/23.
//

import Foundation

struct CTGame: Identifiable {
    let id: UUID = UUID()
    let started: Date
    let ended: Date?
    let questions: [GameQuestion]
    
    var score: Double {
         Double(questions.filter { $0.outcome ?? false }.count / questions.count)
    }
}
