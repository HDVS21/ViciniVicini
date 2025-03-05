//
//  BlurredMiniGameView.swift
//  ArtApp
//
//  Created by Simon Naud on 03/03/25.
//

import SwiftUI

struct BlurredMiniGameView: View {
    
    var painting : String = "stJohnTheBaptist"
    @State var blurEffect : CGFloat = 20
    @State var scores : [Int] = [10, 50, 100]
    @State var answers : [String : Bool] = [
        "Pierre Soulages": false,
        "Leonardo Da Vinci": true,
        "Pablo Picasso": false,
    ]
    
    @State var selectedAnswer : String? = nil
    @State var message : String = ""
    
    var body: some View {
        VStack {
            if selectedAnswer == nil {
            Text("Guess the artist")
                .font(.largeTitle)
            HStack{
                
                    ForEach(scores, id: \.self) { score in
                        Text("\(score)")
                            .padding()
                            .background(Color.yellow)
                            .clipShape(Circle())
                    }
                }
            }
            Image(painting)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
                .blur(radius: selectedAnswer != nil ? 0 : blurEffect)
            
            if selectedAnswer == nil
            {
                if scores.count > 1
                {  Button( action: {
                    if blurEffect > 0 {
                        blurEffect -= 10
                    }
                    if scores.count > 1 {
                        scores.removeLast()
                    }
                }) {
                    Text("Hint")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                }
            }
            if selectedAnswer == nil
            {
                ForEach(answers.keys.sorted(), id: \.self) { answer in
                    Button(action: {
                        if selectedAnswer == nil {
                            selectedAnswer = answer
                            if answers[answer] == true {
                                message = "Congrats! You earned \(scores.last ?? 0) pts"
                            } else {
                                message = "You lose"
                            }
                        }
                    }) {
                        Text(answer)
                            .padding()
                            .frame(width: 300)
                            .background(selectedAnswer == answer ? Color.gray : Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(selectedAnswer != nil)
                }
            }
        }
        Text(message)
            .font(.headline)
            .foregroundColor(.blue)
            .padding()
        
    }
}


#Preview {
    BlurredMiniGameView()
}
