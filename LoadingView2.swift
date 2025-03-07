import SwiftUI

struct LoadingView2: View {
    var body: some View {
        VStack {
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
                .padding()
        }
    }
}
