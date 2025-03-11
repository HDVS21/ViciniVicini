//
//  View1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 5/3/25.
//

import SwiftUI

struct SublessonHeader: View {
    let title: String
    let lettersColor: String
    let backgroundColor: String
    let onBack: () -> Void
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(backgroundColor))
                .frame(height: 280)
            
            VStack(alignment: .leading, spacing: 8) {
                Button(action: {
                    onBack()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color(lettersColor))
                        .padding()
                        .background(Circle().fill(Color.white))
                }
                .padding(.top, 35)
                .padding(.bottom, 60)
                .padding(.leading, 15)
                
                Text(title)
                    .foregroundStyle(Color(lettersColor))
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
    SublessonHeader(
        title: "Introduction to Monet",
        lettersColor: "blue-letters",
        backgroundColor: "blue-background"
    ) {
        presentationMode.wrappedValue.dismiss()
    }
}
