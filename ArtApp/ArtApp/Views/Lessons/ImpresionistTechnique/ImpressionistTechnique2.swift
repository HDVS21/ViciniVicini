//
//  ImpressionistTechnique.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 19/3/25.
//

import SwiftUI

struct ImpressionistTechnique2: View {
    @Binding var path: NavigationPath
    
    let imagesOtherMovements: [Card] = ["painting 1", "painting 2", "painting 3", "painting 4", "painting 5", "painting 6", "painting 7"].map { Card(imageName: $0) }
    
    let imagesImpressionism: [Card] = ["Impressionist painting 1", "Impressionist painting 2", "Impressionist painting 3", "Impressionist painting 4", "Impressionist painting 5", "Impressionist painting 6", "Impressionist painting 7"].map { Card(imageName: $0) }
    
    // Lesson details
    let sublesson: sublessonDetail = sublessonDetail(
        title: NSLocalizedString("The Impresionist Technique", comment: ""),
        lettersColor: "blue-letters",
        backgroundColor: "blue-background"
    )
    
    var body: some View {
        VStack{
            SublessonHeader(title: sublesson.title, lettersColor: sublesson.lettersColor, backgroundColor: sublesson.backgroundColor, path: $path)
            
            Text("Other movements")
                .padding(.top)
            
            CardCarousel(cards: imagesOtherMovements)
            
            Text("Impressionism")
                .padding(.top)
            
            CardCarousel(cards: imagesImpressionism)
                .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                path.append("FindTheFakeView")
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
                
            Spacer()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    ImpressionistTechnique2(path: .constant(NavigationPath()))
}
