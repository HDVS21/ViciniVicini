import SwiftUI

struct MinigamesView: View {
    @State private var unlockedSteps = [true, true, false, false, false, false, false, false, false, false]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SectionInfo()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack {
                            ForEach(0..<10) { index in
                                LessonStep(number: index + 1, position: index % 4, isUnlocked: unlockedSteps[index])
                                    .id(index)
                            }
                        }
                        .padding()
                    }
                    .onAppear {
                        if let lastUnlockedIndex = unlockedSteps.lastIndex(where: { $0 }) {
                            DispatchQueue.main.async {
                                proxy.scrollTo(lastUnlockedIndex, anchor: .center)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct LessonStep: View {
    let number: Int
    let position: Int
    let isUnlocked: Bool
    
    var body: some View {
        HStack {
            if position == 0 { Spacer() }
            if position == 1 { Spacer() }
            
            MinigameButton(number: number, isUnlocked: isUnlocked)
            
            if position == 0 { Spacer() }
            if position == 3 { Spacer() }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 80)
    }
}

struct MinigameButton: View {
    let number: Int
    let isUnlocked: Bool
    
    var body: some View {
        NavigationLink(destination: MinigameDestinationView(minigameNumber: number)) {
            ZStack {
                Circle()
                    .fill(isUnlocked ? .blue : .gray)
                    .frame(width: 80, height: 80)
                
                Text("\(number)")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .disabled(!isUnlocked)
    }
}

struct MinigameDestinationView: View {
    let minigameNumber: Int
    
    var body: some View {
        switch minigameNumber {
        case 1:
            FindTheFakeView()
        case 2:
            BlurredMiniGameView()
        default:
            DefaultMinigameView()
        }
    }
}

struct DefaultMinigameView: View {
    var body: some View {
        Text("Minigame not available")
            .font(.largeTitle)
            .foregroundColor(.red)
            .navigationTitle("Error")
    }
}

#Preview {
    MinigamesView()
}
