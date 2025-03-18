//
//  DragDropMinigame.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 17/3/25.
//

import SwiftUI

struct DragDropMinigame: View {
    @Environment(\.dismiss) var dismiss
    @State var showAlert = false
    @State var isCorrect: Bool = false
    @State var alertShowed = false
    
    var body: some View {
        VStack {
            QuizHeader(title: "Piece by Piece", lettersColor: "green-letters", backgroundColor: "green-background") {
                dismiss()
            }
            
            Text("Complete the puzzle correctly to restore Monet’s masterpiece")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            DragDrop(showAlert: $showAlert, isCorrect: $isCorrect)
                .padding()
            
            Button {
                showAlert.toggle()
                alertShowed.toggle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color("green-buttons"))
                        .frame(width: 280, height: 60)
                    Text(isCorrect && alertShowed ? "Next" : "Confirm Selection")
                        .foregroundStyle(.white)
                        .bold()
                    if showAlert {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.5))
                            .frame(width: 280, height: 60)
                    }
                }
            }
            .disabled(showAlert)
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DragDropMinigame()
}
