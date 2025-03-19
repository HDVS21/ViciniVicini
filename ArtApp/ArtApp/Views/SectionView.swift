//
//  SectionView.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import SwiftUI

struct SectionView: View {
    // Allowing NavigationPath for a clear navigation
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                VStack(spacing: 5) {
                    SectionTileView(sectionTitle: "Introduction to Monet", sectionCategory: "Lesson 1", sectionImage: "LessonOne", isUnlocked: true, userProgress: 0.35, path: $navigationPath);
                    SectionTileView(sectionTitle: "Monet's Famous Works", sectionCategory: "Lesson 2", sectionImage: "Monet's Garden 2", isUnlocked: false, userProgress: 0.0, path: $navigationPath);
                    SectionTileView(sectionTitle: "Monet's Garden in Giverny", sectionCategory: "Lesson 3", sectionImage: "Monet's Garden 3", isUnlocked: false, userProgress: 0.0, path: $navigationPath);
                    SectionTileView(sectionTitle: "The Challenge of Impressionism", sectionCategory: "Lesson 4", sectionImage: "Monet's Garden 4", isUnlocked: false, userProgress: 0.0, path: $navigationPath);
                    SectionTileView(sectionTitle: "Monet and Nature", sectionCategory: "Lesson 5", sectionImage: "Monet's Garden 5", isUnlocked: false, userProgress: 0.0, path: $navigationPath);
                    
                }
                .padding()
            }
            .navigationTitle("Lessons")
            .navigationDestination(for: String.self) { value in
                // Navigate to the correct view based on sectionTitle
                switch value {
                case "Introduction to Monet":
                    IntroductionLesson(path: $navigationPath)
                case "WhoWasMonet":
                    WhoWasMonet(path: $navigationPath)
                case "ImpressionistTechnique":
                    ImpressionistTechnique(path: $navigationPath)
                case "QuickQuiz":
                    QuickQuizView(path: $navigationPath)
                case "ImpressionistTechnique2":
                    ImpressionistTechnique2(path: $navigationPath)
                case "FindTheFakeView":
                    FindTheFakeView(path: $navigationPath)
                case "DragDropMinigame":
                    DragDropMinigame(path: $navigationPath)
                case "SectionView":
                    SectionView()
                default:
                    Text("Page Not Found")
                }
            }
            .onChange(of: navigationPath) { oldValue, newValue in
                print(newValue)
            }
        }
        
    }
}

#Preview {
    SectionView()
}
