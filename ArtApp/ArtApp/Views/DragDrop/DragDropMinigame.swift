//
//  DragDropMinigame.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 17/3/25.
//

import SwiftUI

struct DragDropMinigame: View {
    @State var showAlert = false
    @State var isCorrect: Bool = false
    @State var alertShowed = false
    @Binding var path: NavigationPath
    @State var next = false
    
    var body: some View {
        VStack {
            QuizHeader(title: "Piece by Piece", lettersColor: "green-letters", backgroundColor: "green-background", path: $path)
            
            Text("Complete the puzzle correctly to restore Monet’s masterpiece")
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
            
            DragDrop(showAlert: $showAlert, isCorrect: $isCorrect)
                .padding()
            
            Button {
                if alertShowed && next {
                    path.append("Introduction to Monet")
                } else {
                    showAlert.toggle()
                }
                alertShowed = true
                if isCorrect {
                    next = true
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color("green-buttons"))
                        .frame(width: 280, height: 60)
                    Text(isCorrect && next ? "Next" : "Confirm Selection")
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
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    DragDropMinigame(path: .constant(NavigationPath()))
}
