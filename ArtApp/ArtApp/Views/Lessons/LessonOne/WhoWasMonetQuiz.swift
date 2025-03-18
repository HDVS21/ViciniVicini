//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 5/3/25.
//

import SwiftUI

struct WhoWasMoneQuiz: View {
    // Enables back navigation
    @Binding var path: NavigationPath
    
    // Lesson details
    let sublesson: sublessonDetail = sublessonDetail(
        title: "Who Was Claude\nMonet?",
        lettersColor: "blue-letters",
        backgroundColor: "blue-background"
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            QuizHeader(title: "Quick Quiz", lettersColor: "pink-letters", backgroundColor: "pink-background", path: $path)
            
            VStack(alignment: .leading, spacing: 16) {
//                Text("Objective")
//                    .foregroundStyle(.gray)
//                    .font(.headline)
//                    .bold()
//                    .padding(.top, 20)
                
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WhoWasMoneQuiz(path: .constant(NavigationPath()))
}
