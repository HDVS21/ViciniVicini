//
//  QuickQuizView.swift
//  ArtApp
//
//  Created by Simon Naud on 11/03/25.
//

import SwiftUI

struct QuickQuizView: View {
    @Environment(\.dismiss) var dismiss
    
    let quizDetails = [
        QuickQuiz(question: NSLocalizedString("What type of art influenced Monet’s garden design?", comment: ""), painting: "quickQuiz1", answers: [NSLocalizedString("Italian Renaissance", comment: ""), NSLocalizedString("Japanese prints", comment: ""), NSLocalizedString("Greek sculptures", comment: "")], correctAnswer: "Japanese prints"),
        QuickQuiz(question: NSLocalizedString("What subject did Monet love to paint?", comment: ""), painting: "quickQuiz2", answers: [NSLocalizedString("Mythological creatures", comment: ""), NSLocalizedString("Nature & changing light", comment: ""), NSLocalizedString("Portraits of kings", comment: "")], correctAnswer: "Nature & changing light"),
        QuickQuiz(question: NSLocalizedString("Who was NOT part of Monet’s Impressionist group?", comment: ""), painting: "quickQuiz3", answers: [NSLocalizedString("Edgar Degas", comment: ""), NSLocalizedString("Vincent van Gogh", comment: ""), NSLocalizedString("Pierre-Auguste Renoir", comment: "")], correctAnswer: "Vincent van Gogh"),
    ]
    
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var isAnswerCorrect: Bool?
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var showNextButton = false
    @State private var navigateToLesson = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                QuizHeader(title: "Quick Quiz", lettersColor: "pink-letters", backgroundColor: "pink-background") {
                    dismiss()
                }
                
                let currentQuestion = quizDetails[currentQuestionIndex]
                
                VStack(alignment: .center, spacing: 10) {
                    Spacer()
                    Text(currentQuestion.question)
                        .multilineTextAlignment(.center)
                        .frame(height: 50)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color("pink-options"))
                            .frame(width: 280, height: 159)
                        Image(currentQuestion.painting)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 280, height: 159)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    .clipped()
                    Spacer()
                    

                    ForEach(currentQuestion.answers, id: \.self) { answer in
                        Button(action: {
                            selectedAnswer = answer
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(selectedAnswer == answer ? Color("pink-background") : Color("pink-options"))
                                    .frame(width: 280, height: 53)
                                Text(answer)
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    Spacer()
                    
                    if !showNextButton {
                        Button(action: {
                            guard let selectedAnswer = selectedAnswer else { return }
                            isAnswerCorrect = selectedAnswer == currentQuestion.correctAnswer
                            alertMessage = isAnswerCorrect! ? "Correct!" : "Incorrect! Try again."
                            showAlert = true
                            
            
                            if isAnswerCorrect! {
                                showNextButton = true
                            }
                        }) {
                            ZStack {
                                Capsule()
                                    .frame(width: 215, height: 42)
                                    .foregroundStyle(selectedAnswer != nil ? Color("pink-buttons") : Color.gray)
                                    .shadow(radius: 3)
                                Text("Confirm Selection")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    
                   
                    if showNextButton {
                        Button(action: {
                            if currentQuestionIndex < quizDetails.count - 1 {
                               
                                currentQuestionIndex += 1
                                selectedAnswer = nil
                                isAnswerCorrect = nil
                                showAlert = false
                                showNextButton = false
                            } else {
                             
                                navigateToLesson = true
                            }
                        }) {
                            ZStack {
                                Capsule()
                                    .frame(width: 215, height: 42)
                                    .foregroundStyle( Color("pink-buttons"))
                                    .shadow(radius: 3)
                                Text(currentQuestionIndex < quizDetails.count - 1 ? "Next Question" : "Finish Quiz")
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    
                    NavigationLink(destination: IntroductionLesson().navigationBarHidden(true), isActive: $navigateToLesson) {
                        EmptyView()
                    }
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(isAnswerCorrect! ? "Correct!" : "Incorrect!"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea(.top)
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    QuickQuizView()
}
