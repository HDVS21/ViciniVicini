//
//  AchievmentModel.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import Foundation
import SwiftUI

struct LessonDetail {
    var id: Int
    var title: String
    var objective: String
    var image: String
    var contents: [(title: String, viewIdentifier: String, isChecked: Bool)]
}

struct sublessonDetail {
    var title: String
    var lettersColor: String
    var backgroundColor: String
}
