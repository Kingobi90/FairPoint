import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                AnalysisView()
                    .tabItem {
                        Label("Analysis", systemImage: "chart.bar")
                    }

                ChatView()
                    .tabItem {
                        Label("Chatbot", systemImage: "message")
                    }
            }
            FooterMenu()
                .padding(.bottom, 10)
        }
    }
}
