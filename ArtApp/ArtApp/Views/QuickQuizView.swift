//
//  QuickQuizView.swift
//  ArtApp
//
//  Created by Simon Naud on 11/03/25.
//

import SwiftUI

struct QuickQuizView: View {
    // Enables back navigation
    @Environment(\.presentationMode) var presentationMode
    
    // Quiz details
    let quizDetails = [
        QuickQuiz(question: "What type of art influenced Monet’s garden design?", painting: "Monet's garden", answers: ["Italian Renaissance", "Japanese prints", "Greek sculptures"], correctAnswer: "Japanese prints"),
        QuickQuiz(question: "What subject did Monet love to paint?", painting: "Monet's painting", answers: ["Mythological creatures", "Nature & changing light", "Portraits of kings"], correctAnswer: "Nature & changing light"),
        QuickQuiz(question: "Who was NOT part of Monet’s Impressionist group?", painting: "Monet's painting", answers: ["Edgar Degas", "Vincent van Gogh", "Pierre-Auguste Renoir"], correctAnswer: "Vincent van Gogh"),
        ]
    
       @State private var currentQuestionIndex = 0
       @State private var selectedAnswer: String?
       @State private var isAnswerCorrect: Bool?
    

    
    var body: some View {
        VStack(alignment: .center) {
            QuizHeader(title: "Quick Quiz", lettersColor: "pink-letters", backgroundColor: "pink-background") {
                presentationMode.wrappedValue.dismiss()
            }
  
            let currentQuestion = quizDetails[currentQuestionIndex]
            
            
            VStack(alignment: .center, spacing: 10) {
                Spacer()
                Text(currentQuestion.question)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                ZStack {
                   
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("pink-options"))
                        .frame(width: 280, height: 159)
                    Text(currentQuestion.painting)
                        .font(.caption)
                        .foregroundStyle(Color("pink-letters"))
                }
                Spacer()
                
                ForEach(currentQuestion.answers, id: \.self) { answer in
                               Button(action: {
                                   selectedAnswer = answer
                                   // isAnswerCorrect = answer == currentQuestion.correctAnswer
                               }) {
                                   ZStack{
                                       RoundedRectangle(cornerRadius: 16)
                                           .foregroundColor(selectedAnswer == answer ? Color("pink-background") : Color("pink-options"))
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
                }) {
                    ZStack{
                        Capsule()
                            .frame(width: 215, height: 42)
                            .foregroundStyle(Color("pink-buttons"))
                            .shadow(radius: 3)
                            
                        Text(currentQuestion.cta)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            
                           
                          
                           
                    }
                }
                
            }
            .padding()
          
                
            
            
        }
       
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    QuickQuizView()
}
