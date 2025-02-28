//
//  SectionTileView.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import SwiftUI

struct SectionTileView: View {
    
    var sectionTitle : String
    var sectionImage : String
    var isUnlocked : Bool
    
    var body: some View {
        
       
        
        ZStack {
            
            Image(sectionImage)
               
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .saturation(isUnlocked ? 1 : 0.1)
        
                        
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.black.opacity(0.3))
                              
                                
                        )
                       
                
            Text(sectionTitle)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.bold)
        }
        
        .frame(height: 150)
       
    }
}

#Preview {
    SectionTileView(sectionTitle: "Classicism", sectionImage: "classicism", isUnlocked: true)
}
