//
//  ShowingAndHidingViews.swift
//  iExpense
//
//  Created by Grey  on 12.10.2023.
//

import SwiftUI
// Here we dived into how to go about in hiding and showing screens.
struct SecondView: View {
    @Environment(\.dismiss) var dismiss // This is how we implement the dismiss action with this property wrapper
    
    var body: some View {
        Button ("Dismiss") {
            dismiss() // This is what calls the dismiss action and this in turn makes the page to be dismissed and close
        }
    }
}

struct ShowingAndHidingViews: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        Button ("Show Sheet") {
            isShowingSheet.toggle()
        }
        .sheet(isPresented: $isShowingSheet) { // This is how we use to show a sheet or another screen in SwiftUI by using the sheet.
            SecondView()
        }
    }
}

#Preview {
    ShowingAndHidingViews()
}
