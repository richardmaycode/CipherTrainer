//
//  Int+Ext.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import Foundation

extension Int {
    func digits() -> [Int] {
        var number = self
        var digits: [Int] = []
        while number > 0 {
            digits.insert(number % 10, at: 0)
            number /= 10
        }
        return digits
    }
}
