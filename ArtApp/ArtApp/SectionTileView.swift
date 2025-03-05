import SwiftUI

struct SectionTileView: View {
    var sectionTitle: String
    var sectionCategory: String
    var sectionImage: String
    var isUnlocked: Bool
    var userProgress: Double
    
    var body: some View {
        NavigationLink(destination: MinigamesView()) {
            ZStack {
                Image(sectionImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .saturation(isUnlocked ? 1 : 0.1)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black.opacity(0.3))
                    )
                
                HStack(spacing: 30) {
                    CircleProgressView(userProgress: userProgress)
                        .frame(width: 70, height: 70)
                    
                    VStack(alignment: .leading) {
                        Text(sectionCategory)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(sectionTitle)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                }
            }
            .frame(height: 150)
        }
        .disabled(!isUnlocked)
    }
}

#Preview {
    SectionTileView(sectionTitle: "Classicism", sectionCategory: "Movement", sectionImage: "classicism", isUnlocked: true, userProgress: 0.30)
}
