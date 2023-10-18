//
//  ArchivingWithCodable.swift
//  iExpense
//
//  Created by Grey  on 13.10.2023.
//

import SwiftUI

struct User : Codable {
    let firstName: String
    let lastName: String
}

struct ArchivingWithCodable: View {
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()

            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

#Preview {
    ArchivingWithCodable()
}
