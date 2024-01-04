// GradesView.swift
import SwiftUI

struct GradesView: View {
    var totalProgress: Double = 0.8  // Adjust this value as needed
    
    var body: some View {
        NavigationView {
            VStack {
                // Big Progress Bar at the Top
                ProgressBar(value: totalProgress, color: .blue)
                    .frame(width: 300, height: 40)  // Adjust the dimensions as needed
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                
                Text("Your Grades")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "5A3C85"))
                    .padding(.bottom, 30)
                
                List {
                    Section(header: Text("Term 1").foregroundColor(Color(hex: "5A3C85"))) {
                        GradeCard(subject: "Math", period: "Period 1", progress: 0.75)
                        GradeCard(subject: "English", period: "Period 2", progress: 0.6)
                        GradeCard(subject: "Science", period: "Period 3", progress: 0.9)
                    }
                }
            }
        }
    }
}

struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView()
    }
}
