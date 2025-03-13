//
//  Card.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 11/3/25.
//

import SwiftUI

struct Card: Identifiable, Hashable {
    var id: UUID = .init()
    var color: Color
}
