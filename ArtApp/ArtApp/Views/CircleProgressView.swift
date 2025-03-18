//
//  CircleProgressView.swift
//  ArtApp
//
//  Created by Simon Naud on 03/03/25.
//

import SwiftUI

struct CircleProgressView: View {
    
    var userProgress : Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color.white.opacity(0.5),
                        lineWidth: 10)
            Text("\(userProgress * 100, specifier: "%.0f")%")
                .font(.headline)
                                .foregroundStyle(Color.black)
                                .bold()
            Circle()
                .trim(from: 0, to: userProgress)
                .stroke(
                    Color.white,
                                   style: StrokeStyle(
                                       lineWidth: 10,
                                       lineCap: .round
                                   )
                               )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: userProgress)
            
        }
    }
}

#Preview {
    SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: true, userProgress: 0.7)
}
