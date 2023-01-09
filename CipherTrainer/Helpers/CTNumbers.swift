//
//  CTNumbers.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import Foundation

enum CTNumbers {
    static let ones = [Int](1...9)
    static let tens = [10, 20, 30, 40, 50, 60, 70, 80, 90]
    static let hundreds = [100, 200, 300, 400, 500, 600, 700, 800, 900]
    static let thousands = [1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000]
    
    static let groupedNumbers = [
        1: CTNumbers.ones,
        2: CTNumbers.tens,
        3: CTNumbers.hundreds,
        4: CTNumbers.thousands
    ]
    
    static let allNumbers = [Int](1...9999)
}
