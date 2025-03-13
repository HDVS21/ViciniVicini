//
//  QuickQuizModel.swift
//  ArtApp
//
//  Created by Simon Naud on 11/03/25.
//

import Foundation

struct QuickQuiz {
    var question: String
    var painting: String
    var answers: [String]
    var correctAnswer: String
    var cta: String = "Confirm selection"
}
