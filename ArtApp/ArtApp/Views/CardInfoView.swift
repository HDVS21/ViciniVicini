//
//  CardInfoView.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 11/3/25.
//

import SwiftUI

struct CardInfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var influencesDescripcion: String = "Claude Monet didn’t invent Impressionism in isolation—his style was shaped by three major influences:"
    
    var body: some View {
        VStack {
            LessonHeader(title: "Monet´s Influences", lessonNumber: 0) {
                presentationMode.wrappedValue.dismiss()
            }
            
            Text(influencesDescripcion)
                .padding(.top)
            
            Spacer()
            
            CardCarousel()
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Next")
                    .font(.title2)
                    .padding()
                    .frame(width: 215)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding()
            }
            .padding(.bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CardInfoView()
}
