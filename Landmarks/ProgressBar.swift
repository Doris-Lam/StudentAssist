// ProgressBar.swift
import SwiftUI

struct ProgressBar: View {
    var value: Double
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)  // Adjust the line width as needed
                .opacity(0.3)
                .foregroundColor(Color.gray)
                .frame(width: 30, height: 30)  // Adjust the dimensions as needed
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(value, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))  // Adjust the line width as needed
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
                .frame(width: 30, height: 30)  // Adjust the dimensions as needed
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 0.75, color: .blue)
    }
}
