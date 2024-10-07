//
//  ContentView.swift
//  WorldScramble
//
//  Created by robert theo on 24/09/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                            .setStyleForAmount(item.amount)
                    }
                    
                }.onDelete(perform: removeItems(at:))
            }
        .navigationBarTitle("iExpense")
        .navigationBarItems(leading: EditButton(), trailing:
                NavigationLink(destination: AddView(expenses: expenses)) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    
}

#Preview {
    ContentView()
}
