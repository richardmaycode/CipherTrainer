//
//  String+Ext.swift
//  CipherTrainer
//
//  Created by Richard Wise on 1/9/23.
//

import Foundation

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
