//
//  Expense.swift
//  iExpense
//
//  Created by robert theo on 04/10/24.
//

import Foundation

struct Expense: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
    
}

class Expenses: ObservableObject {
    @Published var items = [Expense]() {
        didSet {
            print(" items\(items)")
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([Expense].self, from: items) {
                print("decoded \(decoded)")
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}
