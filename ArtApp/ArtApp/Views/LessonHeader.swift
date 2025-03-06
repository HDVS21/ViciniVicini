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
    let onBack: () -> Void
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(.systemGray6))
                .frame(height: 280)
            
            VStack(alignment: .leading, spacing: 8) {
                Button(action: {
                    onBack()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.gray)
                        .padding()
                        .background(Circle().fill(Color.white))
                }
                .padding(.top, 35)
                .padding(.bottom, 60)
                .padding(.leading, 15)
                
                Text("Lesson \(lessonNumber)")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.leading, 15)
                
                Text(title)
                    .foregroundStyle(.gray)
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
        lessonNumber: 1
    ) {
        presentationMode.wrappedValue.dismiss()
    }
}
