import SwiftUI
import SwiftData

@main
struct FairPointApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: ArgumentModel.self)
    }
}
