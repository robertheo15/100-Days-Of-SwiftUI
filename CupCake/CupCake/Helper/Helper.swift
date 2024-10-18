//
//  Helper.swift
//  CupCake
//
//  Created by robert theo on 18/10/24.
//

import Foundation

extension String {
    var isTrulyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
