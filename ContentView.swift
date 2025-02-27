import SwiftUI
import SwiftData

struct ContentView: View {
    // Access the SwiftData model context
    @Environment(\.modelContext) private var modelContext
    
    // Fetch all saved ArgumentModel items, sorted by timestamp
    @Query(sort: \ArgumentModel.timestamp, order: .forward)

    private var arguments: [ArgumentModel]
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            HStack {
                Text("Fairpoint by HorizonWebWorX")
                    .font(.headline)
                    .foregroundColor(.black)
                
                // Small green indicator
                Circle()
                    .fill(Color.green)
                    .frame(width: 8, height: 8)
                    .padding(.leading, 4)
                
                Spacer()
            }
            .padding()
            
            // MARK: - Main Content
            // If there is at least one ArgumentModel record, display its fields.
            if let argument = arguments.last {
                VStack(spacing: 16) {
                    ArgumentRow(title: "Topic: \(argument.topic)")
                    ArgumentRow(title: "Goal for Argument: \(argument.goalForArgument)")
                    ArgumentRow(title: "User 1 Perspective: \(argument.user1Perspective)")
                    ArgumentRow(title: "User 2 Perspective: \(argument.user2Perspective)")
                    ArgumentRow(title: "User 1's understanding of User 2: \(argument.user1UnderstandingOfUser2)")
                    ArgumentRow(title: "User 2's understanding of User 1: \(argument.user2UnderstandingOfUser1)")
                }
                .padding(.horizontal)
            } else {
                Text("No argument data available.")
                    .padding()
            }
            
            Spacer()
            
            // MARK: - Continue Button
            // For testing purposes, this button creates a new ArgumentModel record.
            Button(action: {
                // Create a new record with placeholder data.
                let newArgument = ArgumentModel(
                    topic: "New Topic",
                    goalForArgument: "New Goal",
                    user1Perspective: "New User 1 Perspective",
                    user2Perspective: "New User 2 Perspective",
                    user1UnderstandingOfUser2: "New U1 → U2",
                    user2UnderstandingOfUser1: "New U2 → U1"
                )
                modelContext.insert(newArgument)
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .padding(.bottom, 16)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

// MARK: - ArgumentRow
struct ArgumentRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
            
            // Mic icon
            Button(action: {
                print("Mic tapped for \(title)")
            }) {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
            }
            
            // Spacing between icons
            Spacer().frame(width: 16)
            
            // Send button
            Button(action: {
                print("Send tapped for \(title)")
            }) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.gray.opacity(0.1))
        )
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: ArgumentModel.self)
    }
}
