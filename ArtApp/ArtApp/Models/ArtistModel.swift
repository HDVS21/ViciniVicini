//
//  ArtistModel.swift
//  ArtApp
//
//  Created by Simon Naud on 28/02/25.
//

import Foundation

struct Artist {
    var id: Int
    var name: String
    var description: String
    var idMovement: Int
    var birth: String
    var death: String
    var paintings: [Painting]
}
