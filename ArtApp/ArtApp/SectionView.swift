//
//  SectionView.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        ScrollView {
            VStack {
                SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: true, userProgress: 0.7)
                SectionTileView(sectionTitle: "Leonardo da Vinci", sectionCategory: "Artist", sectionImage: "stJohnTheBaptist", isUnlocked: false, userProgress: 0.0);  SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: false, userProgress: 0.0);
                
            }
            .padding()
        }
        
    }
}

#Preview {
    SectionView()
}
