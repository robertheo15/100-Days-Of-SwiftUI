//
//  extension.swift
//  Bookworm
//
//  Created by robert theo on 28/10/24.
//

import Foundation

extension String {
    var isTrulyEmpty: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
