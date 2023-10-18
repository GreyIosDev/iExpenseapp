//
//  ContentView.swift
//  iExpense
//
//  Created by Grey  on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses() // Using the @StateObject asks swiftUI to watch the object for any change announcements to update the view.
    
    @State private var showingAddExpense = false
    
    // This function returns a different color based on the amount passed to it.
    func styleForAmount(_ amount: Double) -> Color {
        if amount < 10 {
            return .green // for amounts under $10
        } else if amount < 100 {
            return .orange // for amounts under $100
        } else {
            return .red // for amounts $100 and over
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in // Added this because this is the only way the OnDelete() modifier would work
                    HStack {
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                            
                        }
                        
                        Spacer()
                        
                        // Use the user's current locale's currency code
                        let currencyCode = Locale.current.currency?.identifier ?? "USD"
                        
                        // Apply the style depending on the amount
                        Text(item.amount, format: .currency(code: currencyCode))
                            .foregroundColor(styleForAmount(item.amount)) // changes the text color based on the amount
                            .bold() // makes the text bold; you can add more styling as needed
                    }
                }
                .onDelete(perform: removeItems) // Added the modifier here so that it would perform the action on each row
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                    //let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    //expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
