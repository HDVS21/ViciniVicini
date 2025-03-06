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
    var contents: [(title: String, view: AnyView)]
}
