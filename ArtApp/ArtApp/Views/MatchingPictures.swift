//
//  Minigame_1.swift
//  ArtApp
//
//  Created by Gustavo Vasquez on 03/03/25.
//

import SwiftUI

struct Line: Identifiable, Hashable {
    let id = UUID()
    let start: CGPoint
    let end: CGPoint
}

struct Minigame_1: View {
    // Left side images
    let leftImages = [
        "minigame1_l1","minigame1_l2","minigame1_l3","minigame1_l4"
    ]
    // right side images
    let rightImages = [
        "minigame1_r1","minigame1_r2","minigame1_r3","minigame1_r4"
    ]
    // Correct answers
    let correctAnswers: [String: String] = [
        "minigame1_l1": "minigame1_r4",
        "minigame1_l2": "minigame1_r1",
        "minigame1_l3": "minigame1_r2",
        "minigame1_l4": "minigame1_r3"
    ]
    
    @State private var connections: [String: String] = [:]
    @State private var showMessage = false
    @State private var isCorrect = false
    @State private var selectedLeft: String? = nil
    @State private var linePositions: [Line] = []
    
    var body: some View {
        VStack {
            Text("Match the fruits with their correct pair")
                .font(.title)
                .padding()
            
            GeometryReader { geometry in
                ZStack {
                    ForEach(linePositions) { line in
                        Path { path in
                            path.move(to: line.start)
                            path.addLine(to: line.end)
                        }
                        .stroke(Color.black, lineWidth: 2)
                    }
                    
                    HStack {
                        VStack {
                            ForEach(leftImages, id: \..self) { image in
                                Image(image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                                    .onTapGesture {
                                        selectedLeft = image
                                    }
                                Text(image.capitalized)
                                    .font(.caption)
                            }
                        }
                        
                        Spacer()
                        
                        VStack {
                            ForEach(rightImages, id: \..self) { image in
                                Image(image)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .overlay(Rectangle().stroke(Color.red, lineWidth: 2))
                                    .onTapGesture {
                                        if let selected = selectedLeft {
                                            connections[selected] = image
                                            selectedLeft = nil
                                            updateLines(geometry: geometry)
                                        }
                                    }
                                Text(image.capitalized)
                                    .font(.caption)
                            }
                        }
                    }
                }
                .onAppear {
                    updateLines(geometry: geometry)
                }
            }
            .padding()
            
            Button("Check Answers") {
                isCorrect = connections == correctAnswers
                showMessage = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            if showMessage {
                Text(isCorrect ? "Success! All matches are correct." : "Error! Try again.")
                    .foregroundColor(isCorrect ? .green : .red)
                    .padding()
            }
        }

        .padding()
    }
    
    private func updateLines(geometry: GeometryProxy) {
        DispatchQueue.main.async {
            linePositions = connections.compactMap { left, right in
                guard let leftIndex = leftImages.firstIndex(of: left),
                      let rightIndex = rightImages.firstIndex(of: right) else {
                    return nil
                }
                
                let leftY = CGFloat(leftIndex) * 100 + 75
                let rightY = CGFloat(rightIndex) * 100 + 75
                
                let leftPoint = CGPoint(x: 80, y: leftY)
                let rightPoint = CGPoint(x: geometry.size.width - 80, y: rightY)
                
                return Line(start: leftPoint, end: rightPoint)
            }
        }
    }
}

#Preview {
    Minigame_1()
}
