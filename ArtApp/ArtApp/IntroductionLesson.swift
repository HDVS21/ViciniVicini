//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez Valdes Salas on 5/3/25.
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
        content: [
            "Who Was Claude Monet?",
            "The Impressionist Technique",
            "Monet's Influences"
        ]
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderView(title: lesson.title, lessonNumber: lesson.id) {
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
                
                ContentListView(contents: lesson.content)
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct HeaderView: View {
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

struct ContentListView: View {
    let contents: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(contents, id: \.self) { item in
                NavigationLink(destination: Text(item)) {
                    HStack {
                        Text(item)
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
