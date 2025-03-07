import SwiftUI

struct FooterMenu: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: { print("Home tapped") }) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.caption)
                }
            }
            Spacer()
            Button(action: { print("Analysis tapped") }) {
                VStack {
                    Image(systemName: "chart.bar")
                    Text("Analysis")
                        .font(.caption)
                }
            }
            Spacer()
            Button(action: { print("Chatbot tapped") }) {
                VStack {
                    Image(systemName: "message")
                    Text("Chatbot")
                        .font(.caption)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.white.shadow(radius: 5))
    }
}
