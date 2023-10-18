//
//  StoringUserData.swift
//  iExpense
//
//  Created by Grey  on 12.10.2023.
//

import SwiftUI



struct StoringUserData: View {
    @AppStorage("tapCount") private var tapCount = 0 // We use the @AppStorage because this is fater and makes use of storing our data straight to the apps memory
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        // In other cases we can use the UserDefaults.standard.set(self.tapCount, forKey:"Tap"
        }
    }
}

#Preview {
    StoringUserData()
}
