//
//  PageControll.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 11/3/25.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var totalCards: Int
    var currentCard: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = totalCards
        control.currentPage = currentCard
        control.backgroundStyle = .minimal
        control.pageIndicatorTintColor = .black
        control.currentPageIndicatorTintColor = .blueBackground
        control.allowsContinuousInteraction = false
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.numberOfPages = totalCards
        uiView.currentPage = currentCard
    }
}

