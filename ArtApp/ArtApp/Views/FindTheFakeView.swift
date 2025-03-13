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
        VStack (alignment: .leading) {
            LessonHeader(title: "Find the fake", lessonNumber: 0, backgroundImage: "blue-background") {
                presentationMode.wrappedValue.dismiss()
            }
            
            Text("Select the painting that does not belong in this group")
                .font(.subheadline)
                .padding()
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(paintings, id: \.self) { painting in
//                    Image(painting)
                    Rectangle()
                        .fill(.gray)
//                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(16.0)
                        .border(selectedPainting == painting ? Color.blue : Color.clear, width: 4)
                        .onTapGesture {
                            selectedPainting = painting
                        }
                }
            }
            .padding()
            
            if selectedPainting != nil {
                Button(action: {
                    if selectedPainting == fakePainting {
                        isCorrect = true
                    } else {
                        isCorrect = false
                    }
                    showResult = true
                }) {
                    Text("Confirm selection")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            } else {
                Text("Confirm selection")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding()
            }
            
            Spacer()
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
