//
//  SectionInfo.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 28/2/25.
//

import SwiftUI

struct SectionInfo: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.orange)
                .cornerRadius(16.0)
                .frame(height: 120)
                .shadow(radius: 10.0)
            HStack {
                Text("Section Name")
                    .font(.title2)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "book.pages")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)
                
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SectionInfo()
}
