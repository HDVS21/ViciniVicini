//
//  BlurredMiniGameView.swift
//  ArtApp
//
//  Created by Simon Naud on 17/03/25.
//

import SwiftUI

struct BlurredMiniGameView: View {
    @Environment(\.dismiss) var dismiss
    
    let quizDetails =
        QuickQuiz(question: "Guess the painting behind the blur", painting: "quickQuiz1", answers: ["Waterlilies and japanese bridge", "Japanese bridge", "Waterlily pond, green harmony"], correctAnswer: "Water lilies and japanese bridge")
   
    @State private var selectedAnswer: String?
    @State private var isAnswerCorrect: Bool?
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToLesson = false
    
    @State var blurEffect : CGFloat = 20
    
    var body: some View {
        NavigationStack {
       
            VStack(alignment: .center) {
                QuizHeader(title: "Blurred Masterpiece", lettersColor: "green-letters", backgroundColor: "green-background") {
                    dismiss()
                }
                VStack{
                let currentQuestion = quizDetails
                
                VStack(alignment: .center, spacing: 10) {
                    Spacer()
                    Text(currentQuestion.question)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("green-options"))
                            .frame(width: 280, height: 159)
                        Image(currentQuestion.painting)
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
                                .foregroundColor(Color("green-buttons") )
                                .frame(width: 90, height: 20)
                                .shadow(radius: 3)
                            Text("Get a hint")
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                    
                    ForEach(currentQuestion.answers, id: \.self) { answer in
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
                        isAnswerCorrect = selectedAnswer == currentQuestion.correctAnswer
                        alertMessage = isAnswerCorrect! ? "Correct!" : "Incorrect! Try again."
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
        
    }
}


#Preview {
    BlurredMiniGameView()
}
