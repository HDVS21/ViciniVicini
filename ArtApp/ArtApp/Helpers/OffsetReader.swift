//
//  OffsetReader.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 11/3/25.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func offsetX(_ addObserver: Bool, completition: @escaping (CGRect) -> ()) -> some View {
        self
            .frame(maxWidth: .infinity)
            .overlay{
                if addObserver {
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        
                        Color.clear
                            .preference(key: OffsetKey.self, value: rect)
                            .onPreferenceChange(OffsetKey.self, perform: completition)
                    }
                }
            }
    }
}
