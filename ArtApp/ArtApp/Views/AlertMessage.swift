//
//  Alert.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 17/3/25.
//

import SwiftUI

struct AlertMessage: View {
    @State var color: String
    @Binding var isCorrect: Bool
    @Binding var showAlert: Bool
    let message: (title: String, subtitle: String)
    
    let correctMessages = [
            ("Brilliant!", "You’re seeing the world like Monet!"),
            ("Yes!", "Monet would be proud"),
            ("Correct!", "You’ve got an eye for art"),
            ("Spot on!", "That’s an Impressionist-level answer!")
        ]
    
    let incorrectMessages = [
            ("Oops! Not quite", "Give it another shot!"),
            ("Not the right brushstroke!", "Give it another go"),
            ("Almost!", "Look closely and try once more"),
            ("Oh no!", "Monet would disagree")
        ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(color + "-options"))
            VStack {
                Spacer()
                Text(isCorrect ? correctMessages.randomElement()!.0 : incorrectMessages.randomElement()!.0)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 2)
                Text(isCorrect ? correctMessages.randomElement()!.1 : incorrectMessages.randomElement()!.1)
                    .font(.caption)
                    .foregroundStyle(.black)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                Button {
                    showAlert.toggle()
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color(color + "-buttons"))
                            .frame(height: 45)
                        Text(isCorrect ? "Continue" : "Try Again")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    
                }
            }
                
        }
        .cornerRadius(20)
        .frame(width: 260, height: 140)
    }
}
//
//#Preview {
//    AlertMessage(color: "green", isCorrect: true, message: ("Brilliant", "You’re seeing the world like Monet!"))
//}
