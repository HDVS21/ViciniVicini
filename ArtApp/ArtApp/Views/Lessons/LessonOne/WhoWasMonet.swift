//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 5/3/25.
//

import SwiftUI

struct WhoWasMonet: View {
    @Binding var path: NavigationPath
    
    // Lesson details
    let sublesson: sublessonDetail = sublessonDetail(
        title: "Who Was Claude\nMonet?",
        lettersColor: "blue-letters",
        backgroundColor: "blue-background"
    )
    
    let description: String = "Claude Monet (1840–1926) was a French artist and the founder of Impressionism. Born in Paris, he loved drawing and painting outdoors (en plein air). His painting Impression, Sunrise (1872) inspired the name “Impressionism.”"
    
    var body: some View {
        VStack(alignment: .leading) {
            SublessonHeader(title: sublesson.title, lettersColor: sublesson.lettersColor, backgroundColor: sublesson.backgroundColor, path: $path)
            
            VStack( spacing: 20) {
                Image("Monet Picture")
                    .resizable()
                    .cornerRadius(16)
                    .frame(width: 180, height: 220)
                
                
                // Description text
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                
                // Quiz Button (Using NavigationPath)
                Button(action: {
                    path.append("QuickQuiz")
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("blue-buttons"))
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(1.0), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal, 50)
                
            }
            .padding()
            Spacer()
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    WhoWasMonet(path: .constant(NavigationPath()))
}
