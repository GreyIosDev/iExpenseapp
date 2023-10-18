//
//  ExplainingStateProperty.swift
//  iExpense
//
//  Created by Grey  on 12.10.2023.
//

import SwiftUI
// In this section we defined how a @State property works and basically what to understand and how it goes.


// NOTE: An @State is a property wrapper that allows us to modify values inside a struct. And then this in turn allows your view to respond to any changes made to @State


// Basically this is how we make sure that the view would update when using classes instead of structs.

class User1: ObservableObject { // The ObservableObject enable the class to be oberseved by views or multiple views.
    
    // Here we mark the class and make it conform to the ObservableObject so that it would be oberseved for changes
    
    @Published var firstName = "Bilbo" // We marked this property with @Published so that any views using the class stated above so will be updated when those values change
    @Published var lastName = "Baggins"
}

struct ExplainingStateProperty: View {
    @StateObject var user = User1() // This is how we make an instance of a class as compared to "@State" in the case of a Struct. And this is used when you create the data for the first time
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

#Preview {
    ExplainingStateProperty()
}
