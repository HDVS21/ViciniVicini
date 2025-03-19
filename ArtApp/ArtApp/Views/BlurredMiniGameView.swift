//
//  BlurredMiniGameView.swift
//  ArtApp
//
//  Created by Simon Naud on 17/03/25.
//

import SwiftUI

struct BlurredMiniGameView: View {
    @Binding var path: NavigationPath
    
    let quizDetails =
        QuickQuiz(question: "Guess the painting behind the blur", painting: "quickQuiz1", answers: ["Waterlilies and japanese bridge", "Japanese bridge", "Waterlily pond, green harmony"], correctAnswer: "Waterlilies and japanese bridge")
   
    @State private var selectedAnswer: String?
    @State private var isAnswerCorrect: Bool = false
    @State private var showAlert = false
    @State var blurEffect: CGFloat = 20
    
    var body: some View {
        ZStack{
        NavigationStack {
            VStack(alignment: .center) {
                QuizHeader(title: "Blurred Masterpiece", lettersColor: "green-letters", backgroundColor: "green-background", path: $path)
                VStack {
                    VStack(alignment: .center, spacing: 10) {
                        Spacer()
                        Text(quizDetails.question)
                            .multilineTextAlignment(.center)
                            .frame(height: 50)
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color("green-options"))
                                .frame(width: 280, height: 159)
                            Image(quizDetails.painting)
                                .resizable()
                                .scaledToFill()
                                .blur(radius: blurEffect)
                                .frame(width: 280, height: 159)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .clipped()
                        
                        Button {
                            blurEffect -= 5
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(blurEffect > 0 ? Color("green-buttons") : Color.gray)
                                    .frame(width: 90, height: 20)
                                    .shadow(radius: 3)
                                Text("Get a hint")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white)
                            }
                        }
                        Spacer()
                        
                        ForEach(quizDetails.answers, id: \ .self) { answer in
                            Button(action: {
                                selectedAnswer = answer
                            }) {
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(selectedAnswer == answer ? Color("green-background") : Color("green-options"))
                                        .frame(width: 280, height: 53)
                                    Text(answer)
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                        Spacer()
                        
                        Button(action: {
                            guard let selectedAnswer = selectedAnswer else { return }
                            isAnswerCorrect = selectedAnswer == quizDetails.correctAnswer
                            showAlert = true
                        }) {
                            ZStack {
                                Capsule()
                                    .frame(width: 215, height: 42)
                                    .foregroundStyle(selectedAnswer != nil ? Color("green-buttons") : Color.gray)
                                    .shadow(radius: 3)
                                Text("Confirm Selection")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }
        .toolbar(.hidden, for: .navigationBar)
        
        if showAlert {
            ZStack{
                Rectangle()
                    .fill(.white.opacity(0.5))
                    .ignoresSafeArea()
                AlertMessage(color: "green", isCorrect: $isAnswerCorrect, showAlert: $showAlert, message: ("", ""))
            }
        
        }
    }
    }
}

#Preview {
    BlurredMiniGameView(path: .constant(NavigationPath()))
}
