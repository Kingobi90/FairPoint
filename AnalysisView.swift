import SwiftUI

// MARK: - Data Models & Shapes

// Data model for each pie slice.
struct PieSliceData {
    let name: String
    let value: Double
    let color: Color
}

// Helper model that holds the computed start and end angles.
struct PieSlice {
    let startAngle: Angle
    let endAngle: Angle
    let color: Color
}

// Custom Shape for drawing each pie slice.
struct PieSliceShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.move(to: center)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: false)
        path.closeSubpath()
        return path
    }
}

// MARK: - PieChartView

struct PieChartView: View {
    let data: [PieSliceData]
    
    // Pre-calculate the slices to avoid mutating state during view building.
    var slices: [PieSlice] {
        var slices: [PieSlice] = []
        let total = data.reduce(0) { $0 + $1.value }
        var startDegree = 0.0
        for sliceData in data {
            let degrees = (sliceData.value / total) * 360
            let slice = PieSlice(
                startAngle: Angle(degrees: startDegree),
                endAngle: Angle(degrees: startDegree + degrees),
                color: sliceData.color
            )
            slices.append(slice)
            startDegree += degrees
        }
        return slices
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<slices.count, id: \.self) { i in
                    PieSliceShape(
                        startAngle: slices[i].startAngle,
                        endAngle: slices[i].endAngle
                    )
                    .fill(slices[i].color)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

// MARK: - AnalysisBox

struct AnalysisBox: View {
    let title: String
    var height: CGFloat = 80
    var backgroundColor: Color = Color.gray.opacity(0.1)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding()
            Spacer()
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// MARK: - AnalysisView

struct AnalysisView: View {
    
    // Example pie chart data.
    let pieData = [
        PieSliceData(name: "Bias Detection",  value: 25, color: .green),
        PieSliceData(name: "Emotional Tone",  value: 25, color: .orange),
        PieSliceData(name: "Clarity",         value: 25, color: .blue),
        PieSliceData(name: "Relevance",       value: 25, color: .purple)
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Top Bar
            HStack {
                Button(action: {
                    // Handle navigation back.
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("FairPoint by HorizonWebWorX")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                // Placeholder to balance layout.
                Spacer().frame(width: 24)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            
            // Pie Chart
            PieChartView(data: pieData)
                .frame(width: 120, height: 120)
                .padding(.top, 8)
            
            // Subtitle
            Text("Honestly, I see why this is tricky.")
                .font(.body)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Section Title
            Text("Fairpoint analysis")
                .font(.headline)
                .foregroundColor(.orange)
            
            // Analysis Grid (2x2) with custom colors.
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
            LazyVGrid(columns: columns, spacing: 16) {
                AnalysisBox(title: "Bias Detection", backgroundColor: .blue)
                AnalysisBox(title: "Emotional Tone", backgroundColor: .purple)
                AnalysisBox(title: "Clarity", backgroundColor: .orange)
                AnalysisBox(title: "Relevance", backgroundColor: .green)
            }
            .padding(.horizontal)
            
            // Breakdown Box
            AnalysisBox(title: "Breakdown", height: 100)
                .padding(.horizontal)
            
            Spacer()
            
            // Continue Button
            Button(action: {
                // Handle "Continue" action.
            }) {
                HStack {
                    Spacer()
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(.headline)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.yellow)
                .cornerRadius(8)
                .padding(.horizontal)
                .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
            }
            
            Spacer().frame(height: 16)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

// MARK: - Preview

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
