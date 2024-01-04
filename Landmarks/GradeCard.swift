// GradeCard.swift
import SwiftUI

struct GradeCard: View {
    var subject: String
    var period: String
    var progress: Double
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(subject)
                        .font(.headline)
                        .foregroundColor(Color(hex: "5A3C85"))
                    Text("Period: \(period)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                ProgressBar(value: progress, color: .blue)
                    .frame(width: 30, height: 30)  // Adjust the dimensions as needed
            }
            .padding()
            .background(Color(hex: "D9CFFF"))
            .cornerRadius(12)
            .shadow(radius: 4)
            .padding(.vertical, 4)
        }
    }
}

struct GradeCard_Previews: PreviewProvider {
    static var previews: some View {
        GradeCard(subject: "Math", period: "Period 1", progress: 0.75)
    }
}
