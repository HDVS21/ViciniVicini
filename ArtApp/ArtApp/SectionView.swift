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
                SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: true)
                SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: false); SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: false); SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: false)
                
            }
            .padding()
        }
        
    }
}

#Preview {
    SectionView()
}
