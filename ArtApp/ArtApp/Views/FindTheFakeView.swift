//
//  FindTheFakeView.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 5/3/25.
//

import SwiftUI

struct FindTheFakeView: View {
    @Binding var path: NavigationPath
    
    var paintings = ["Bridge 1", "Rouen Cathedral 1", "Impressionist painting 4", "painting 6"]
    
    // Estado para manejar la selección del usuario
    @State private var selectedPainting: String? = nil
    @State private var showAlert = false
    @State private var isCorrect = false
    @State private var next = false
    
    @State var fakePainting = "painting 6"
    
    @State var correctAlertShowed = false
    
    var body: some View {
        ZStack {
            VStack () {
                QuizHeader(title: "Find the Fake", lettersColor: "green-letters", backgroundColor: "green-background", path: $path)
                
                Spacer()
                
                Text("Select the painting that does not belong in this group")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(paintings, id: \.self) { painting in
                        Image(painting)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 159 ,height: 159)
                            .cornerRadius(16.0)
                            .border(selectedPainting == painting ? Color("green-buttons") : Color.clear, width: 4)
                            .padding(8)
                            .onTapGesture {
                                selectedPainting = painting
                            }
                    }
                }
                .padding()
                
                Spacer()
                
                if selectedPainting != nil {
                    Button(action: {
                        if next {
                            path.append("DragDropMinigame")
                            correctAlertShowed = true
                        }
                        if selectedPainting == fakePainting {
                            isCorrect = true
                            next = true
                        } else {
                            isCorrect = false
                        }
                        
                        if !correctAlertShowed{
                            showAlert = true
                        }
                        
                
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(Color("green-buttons"))
                                .frame(width: 280, height: 60)
                            Text(isCorrect ? "Next" : "Confirm Selection")
                                .foregroundStyle(.white)
                                .bold()
                            if showAlert {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white.opacity(0.5))
                                    .frame(width: 280, height: 60)
                            }
                        }
                    }
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(Color("green-buttons"))
                            .frame(width: 280, height: 60)
                        Text("Confirm Selection")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
            
            if showAlert {
                ZStack {
                    Rectangle()
                        .fill(.white.opacity(0.5))
                        .ignoresSafeArea()
                    AlertMessage(color: "green", isCorrect: $isCorrect, showAlert: $showAlert, message: ("hola", "mundo"))
                }
            }
        }

        .navigationBarHidden(true)
    }
}

#Preview {
    FindTheFakeView(path: .constant(NavigationPath()))
}
