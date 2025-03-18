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
        title: NSLocalizedString("Introduction to Claude Monet", comment: "Title of the lesson"),
        objective: NSLocalizedString("Get to know Claude Monet, one of the most famous painters in the history", comment: "Objective of the lesson"),
        image: "LessonOne",
        contents: [
            (NSLocalizedString("Who was Monet?", comment: "Who was Monet?"), AnyView(WhoWasMonet()), true),
            (NSLocalizedString("The Impressionist Technique", comment: "The Impressionist Technique"), AnyView(WhoWasMonet()), false),
            (NSLocalizedString("Monet’s Influences", comment: "Monet’s Influences"), AnyView(WhoWasMonet()), false)
        ]
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            LessonHeader(title: lesson.title, lessonNumber: lesson.id, backgroundImage: lesson.image) {
                presentationMode.wrappedValue.dismiss()
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Objective")
                    .foregroundStyle(Color("blue-letters"))
                    .font(.headline)
                    .bold()
                    .padding(.top, 20)
                
                Text(lesson.objective)
                    .font(.body)
                    .foregroundStyle(Color("blue-letters"))
                    .padding(.bottom, 20)
                
                Text("Content")
                    .foregroundStyle(Color("blue-letters"))
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
    let contents: [(title: String, view: AnyView, isChecked: Bool)]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(contents.indices, id: \.self) { index in
                let content = contents[index]
                NavigationLink(destination: content.view) {
                    HStack {
                        // Checkbox
                        Image(systemName: content.isChecked ? "checkmark.square.fill" : "square")
                            .foregroundColor(Color("blue-letters"))
                        Text(content.title)
                            .font(.body)
                            .foregroundColor(Color("blue-letters"))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color("blue-letters"))
                    }
                    .padding()
                    .background(Color("blue-light"))
                }
                Divider()
            }
        }
        .navigationBarHidden(true)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
                

#Preview {
    IntroductionLesson()
}
