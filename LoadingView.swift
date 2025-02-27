import SwiftUI

struct LoadingView: View {
    // A collection of words to display in a “word cloud.”
    private let words: [String] = [
        "Critically", "Communication", "Awareness", "Speak", "Argument",
        "Expression", "Ground", "Fairness", "Resolution", "Both",
        "Calm", "Balanced", "Analysis", "Relevance", "Assertive",
        "Clarity", "Articulation", "Compromise", "Rationality",
        "Critical", "Dialogue", "Perspective", "Confidence",
        "Emotional", "Nuance", "Listening", "Discussion"
    ]
    
    var body: some View {
        ZStack {
            // Background color
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            // Randomly place words
            GeometryReader { geometry in
                ZStack {
                    ForEach(words.indices, id: \.self) { index in
                        let word = words[index]
                        let randomX = CGFloat.random(in: 0...geometry.size.width)
                        let randomY = CGFloat.random(in: 0...geometry.size.height)
                        
                        Text(word)
                            .font(.system(size: randomFontSize()))
                            .foregroundColor(randomColor())
                            // Position the text at a random point in the geometry
                            .position(x: randomX, y: randomY)
                    }
                }
            }
            
            // “FAIRPOINT” title at the top
            VStack {
                Text("FAIRPOINT")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Spacer()
            }
        }
    }
    
    // MARK: - Random Helpers
    
    // Returns a random font size between 14 and 28
    private func randomFontSize() -> CGFloat {
        CGFloat.random(in: 14...28)
    }
    
    // Returns a random color from a small set
    private func randomColor() -> Color {
        let colors: [Color] = [
            .blue, .red, .orange, .purple, .green, .white, .black
        ]
        return colors.randomElement() ?? .black
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
