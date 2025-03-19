//
//  ImpressionistTechnique.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 19/3/25.
//

import SwiftUI

struct ImpressionistTechnique: View {
    @Binding var path: NavigationPath
    
    // Lesson details
    let sublesson: sublessonDetail = sublessonDetail(
        title: NSLocalizedString("The Impresionist Technique", comment: ""),
        lettersColor: "blue-letters",
        backgroundColor: "blue-background"
    )
    
    let description: String = "Before Monet, artists painted detailed, realistic scenes. Monet and other Impressionists (like Renoir and Degas) wanted to capture movement, color, and light with quick brushstrokes and bright colors. Their paintings looked unfinished, and critics hated them!”"
    
    var body: some View {
        VStack{
            SublessonHeader(title: sublesson.title, lettersColor: sublesson.lettersColor, backgroundColor: sublesson.backgroundColor, path: $path)
            
            Spacer()
            
            Image("Impression, Sunrise")
                .resizable()
                .scaledToFill()
                .cornerRadius(20)
                .frame(width: 300, height: 200)
            
            Spacer()
            
            Text(description)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            Spacer()
            
            Button(action: {
                path.append("ImpressionistTechnique2")
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
    ImpressionistTechnique(path: .constant(NavigationPath()))
}
