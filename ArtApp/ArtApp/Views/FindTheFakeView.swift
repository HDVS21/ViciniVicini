//
//  FindTheFakeView.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 5/3/25.
//

import SwiftUI

struct FindTheFakeView: View {
    @Environment(\.dismiss) var dismiss
    
    var paintings = ["ftf1-painting1", "ftf1-painting2", "ftf1-painting3", "ftf1-fakePainting"]
    
    // Estado para manejar la selección del usuario
    @State private var selectedPainting: String? = nil
    @State private var showAlert = false
    @State private var isCorrect = false
    
    @State var fakePainting = "fakePainting"
    
    var body: some View {
        ZStack {
            VStack () {
                QuizHeader(title: "Find the Fake", lettersColor: "green-letters", backgroundColor: "green-background", path: .constant(NavigationPath()))
                
                Spacer()
                
                Text("Select the painting that does not belong in this group")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding()
                
                Spacer()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(paintings, id: \.self) { painting in
    //                    Image(painting)
                        Rectangle()
                            .fill(.gray)
    //                        .resizable()
    //                        .scaledToFit()
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
                        if selectedPainting == fakePainting {
                            isCorrect = true
                        } else {
                            isCorrect = false
                        }
                        showAlert = true
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
    FindTheFakeView()
}
