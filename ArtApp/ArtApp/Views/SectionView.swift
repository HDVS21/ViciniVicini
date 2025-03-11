//
//  SectionView.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 15) {
                    SectionTileView(sectionTitle: "Introduction to Monet", sectionCategory: "Lesson 1", sectionImage: "LessonOne", isUnlocked: true, userProgress: 0.7)
                    SectionTileView(sectionTitle: "Monet's Famous Works", sectionCategory: "Lesson 2", sectionImage: "LessonTwo", isUnlocked: false, userProgress: 0.0);
                    SectionTileView(sectionTitle: "Monet's Garden in Giverny", sectionCategory: "Lesson 3", sectionImage: "classicism", isUnlocked: false, userProgress: 0.0);
                    SectionTileView(sectionTitle: "The Challenge of Impressionism", sectionCategory: "Lesson 4", sectionImage: "stJohnTheBaptist", isUnlocked: false, userProgress: 0.0);
                    SectionTileView(sectionTitle: "Monet and Nature", sectionCategory: "Lesson 5", sectionImage: "classicism", isUnlocked: false, userProgress: 0.0);
                    
                }
                .padding()
            }
            .navigationTitle("Lessons")
            
        }
        
    }
}

#Preview {
    SectionView()
}
