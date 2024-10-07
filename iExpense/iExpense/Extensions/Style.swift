//
//  style.swift
//  iExpense
//
//  Created by robert theo on 04/10/24.
//

import Foundation
import SwiftUI

struct StyleOfAmount: ViewModifier {
    var amount: Int
    func body(content: Content) -> some View {
        var font = Font.system(size: 22, weight: .heavy, design: .default)
        var foregroundColor = Color.black
        if amount < 10 {
            foregroundColor = Color.blue
            
        } else if amount == 10 || amount < 100 {
            
            foregroundColor = Color.purple
            font = Font.system(size: 25, weight: .medium, design: .monospaced)
        } else {
            foregroundColor = Color.red
            font = Font.system(size: 30, weight: .bold, design: .rounded)
            
        }
        return content
            .foregroundColor(foregroundColor)
            .font(font)
    }
}

extension View {
    func setStyleForAmount(_ amount: Int) -> some View {
        self.modifier(StyleOfAmount(amount: amount))
    }
}
