//
//  FindTheFakeView.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 5/3/25.
//

import SwiftUI

struct FindTheFakeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var paintings = ["painting1", "painting2", "painting3", "fakePainting"]
    
    // Estado para manejar la selección del usuario
    @State private var selectedPainting: String? = nil
    @State private var showResult = false
    @State private var isCorrect = false
    
    @State var fakePainting = "fakePainting"
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            QuizHeader(title: "Find the fake", lettersColor: "green-letters", backgroundColor: "green-background") {
             
            }
            Spacer()
            
            Text("Select the painting that does not belong in this group")
                .multilineTextAlignment(.center)
                
            Spacer()

            LazyVGrid(columns: [
                          GridItem(.flexible(), spacing: -20),
                          GridItem(.flexible(), spacing: -20)
                      ], spacing: 20) {
                ForEach(paintings, id: \.self) { painting in
//                    Image(painting)
                    Rectangle()
                        .fill(.gray)
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(16.0)
                        .overlay(
                        
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke(selectedPainting == painting ? Color("green-background") : Color.clear, lineWidth: 4)
                        )
                        .onTapGesture {
                            selectedPainting = painting
                        }
                }

            }
            .padding()
            Spacer()


            if selectedPainting != nil {
                Button(action: {
                    if selectedPainting == fakePainting {
                        isCorrect = true
                    } else {
                        isCorrect = false
                    }
                    showResult = true
                }) {
                    ZStack {
                        Capsule()
                            .frame(width: 215, height: 42)
                            .foregroundStyle(Color("green-buttons"))
                            .shadow(radius: 3)
                        Text("Confirm selection")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            } else {
                ZStack {
                    Capsule()
                        .frame(width: 215, height: 42)
                        .foregroundStyle(Color.gray)
                        .shadow(radius: 3)
                    Text("Confirm selection")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .padding()
                }
            }
            
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
        .alert(isPresented: $showResult) {
            Alert(
                title: Text(isCorrect ? "Correct!" : "Incorrect"),
                message: Text(isCorrect ? "You chose the right answer." : "Try again."),
                dismissButton: .default(Text("Continue")) {
                    selectedPainting = nil
                }
            )
        }
    }
}

#Preview {
    FindTheFakeView()
}
