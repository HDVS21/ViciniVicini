//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 5/3/25.
//

import SwiftUI

struct LessonHeader: View {
    let title: String
    let lessonNumber: Int
    let backgroundImage: String
    
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(.clear))
                .frame(height: 280)
                .background(
                    Image(backgroundImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 280) // Ensure it matches the RoundedRectangle's size
                        .clipShape(RoundedRectangle(cornerRadius: 40)) // Clip to rounded shape
                        .opacity(0.50)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Button(action: {
                    path.removeLast()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color("blue-letters"))
                        .padding()
                        .background(Circle().fill(Color.white))
                }
                .padding(.top, 35)
                .padding(.bottom, 60)
                .padding(.leading, 15)
                
                Text("Lesson \(lessonNumber)")
                    .font(.caption)
                    .foregroundStyle(.black)
                    .padding(.leading, 15)
                
                Text(title)
                    .foregroundStyle(.black)
                    .font(.title)
                    .bold()
                    .padding(.leading, 15)
            }
            .padding()
        }
    }
}

#Preview {
    @Previewable @Environment(\.presentationMode) var presentationMode
    LessonHeader(
        title: "Introduction to Monet",
        lessonNumber: 1,
        backgroundImage: "LessonOne",
        path: .constant(NavigationPath())
    )
}
