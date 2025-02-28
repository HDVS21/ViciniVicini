//
//  SectionModel.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import Foundation

struct Section {
    var id: Int
    var name: String
    var description : String
    var artists : [Artist]
    var movement: [Movement]
    var miniGame : [MiniGame]
}
