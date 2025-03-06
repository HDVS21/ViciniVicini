//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 5/3/25.
//

import SwiftUI

struct WhoWasMonet: View {
    // Enables back navigation
    @Environment(\.presentationMode) var presentationMode
    
    // Lesson details
    let lesson: LessonDetail = LessonDetail(
        id: 1,
        title: "Who Was Claude\nMonet?",
        objective: "Get to know Claude Monet, one of the most famous painters in history",
        contents: []
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            LessonHeader(title: lesson.title, lessonNumber: lesson.id) {
                presentationMode.wrappedValue.dismiss()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Objective")
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .bold()
                    .padding(.top, 20)
                
                Text(lesson.objective)
                    .font(.body)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 20)
                
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WhoWasMonet()
}
