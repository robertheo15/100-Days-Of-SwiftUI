//
//  AddView.swift
//  WorldScramble
//
//  Created by robert theo on 28/09/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .navigationBarItems(leading: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }, trailing: Button("Save") {
                let item = Expense(name: name, type: type, amount: Int(amount))
                expenses.items.append(item)
                presentationMode.wrappedValue.dismiss()
            
            })
            .navigationBarBackButtonHidden(true)
        }.navigationBarHidden(true)
        
    }
}

#Preview {
    AddView(expenses: Expenses())
}
