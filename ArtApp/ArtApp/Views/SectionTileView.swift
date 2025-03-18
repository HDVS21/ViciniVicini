import SwiftUI

struct SectionTileView: View {
    var sectionTitle: String
    var sectionCategory: String
    var sectionImage: String
    var isUnlocked: Bool
    var userProgress: Double
    
    var body: some View {
        NavigationLink(destination: IntroductionLesson()) {
            ZStack {
                Image(sectionImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 130)
                    .saturation(isUnlocked ? 1 : 0.1)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.white.opacity(0.5))
                    )
                
                HStack() {
                    HStack {
                        
                        CircleProgressView(userProgress: userProgress)
                            .frame(width: 70, height: 70)
                            .padding()
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text(sectionCategory)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        Text(sectionTitle)
                            .font(.title2)
                            .foregroundStyle(Color("blue-letters"))
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing)
                        
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 150)
        }
        .disabled(!isUnlocked)
    }
}

#Preview {
    SectionTileView(sectionTitle: "Introduction to Monet", sectionCategory: "Lesson 1", sectionImage: "classicism", isUnlocked: true, userProgress: 0.30)
}
