//
//  DeletingItems.swift
//  iExpense
//
//  Created by Grey  on 12.10.2023.
//

import SwiftUI

struct DeletingItems: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers, id: \.self) { // the onDelete() modifier only exists on ForEach
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows) // we call it here after the ForEach so that it deletes for each row
                }
                
                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
        }
        .navigationTitle("onDelete()")
        .toolbar {
            EditButton() // This addes a turn of functionality to enable us to be able to select what to delete
        }
    }
    // In order to make onDelete() work we have to call this function always
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeletingItems()
}
