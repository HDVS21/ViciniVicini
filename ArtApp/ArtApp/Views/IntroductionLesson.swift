//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 5/3/25.
//

import SwiftUI

struct IntroductionLesson: View {
    // Enables back navigation
    @Environment(\.presentationMode) var presentationMode
    
    // Lesson details
    let lesson: LessonDetail = LessonDetail(
        id: 1,
        title: "Introduction to \nMonet",
        objective: "Get to know Claude Monet, one of the most famous painters in history",
        contents: [
            ("Who Was Claude Monet?", AnyView(WhoWasMonet())),
            ("The Impressionist Technique", AnyView(WhoWasMonet())),
            ("Monet’s Influences", AnyView(WhoWasMonet()))
        ]
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
                
                Text("Content")
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .bold()
                
                ContentListView(contents: lesson.contents)
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentListView: View {
    let contents: [(title: String, view: AnyView)]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(contents.indices, id: \.self) { index in
                let content = contents[index]
                NavigationLink(destination: content.view) {
                    HStack {
                        Text(content.title)
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                }
                Divider()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
                

#Preview {
    IntroductionLesson()
}
