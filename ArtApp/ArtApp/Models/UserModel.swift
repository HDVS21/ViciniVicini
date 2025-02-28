//
//  UserModel.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import Foundation

struct User {
    var id: Int
    var username: String
    var avatar : String
    var sectionsCompleted : [Section]
    var achievements : [Achievement]
    var progress : Int
}
