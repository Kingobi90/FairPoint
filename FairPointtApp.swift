//
//  FairPointtApp.swift
//  FairPointt
//
//  Created by Obinna Chukwu on 2/26/25.
//

import SwiftUI
import SwiftData

@main
struct FairPointApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ArgumentModel.self) // Attach SwiftData storage
        }
    }
}
