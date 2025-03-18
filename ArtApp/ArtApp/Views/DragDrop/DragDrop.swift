//
//  DragDrop.swift
//  ArtApp
//
//  Created by Hector Daniel Valdes Salas on 17/3/25.
//

import SwiftUI

struct DragDrop: View {
    @State var arrImages: [String] = {
        var shuffled = ["img1", "img2", "img3", "img4", "img5", "img6"]
        repeat {
            shuffled.shuffle()
        } while shuffled == ["img1", "img2", "img3", "img4", "img5", "img6"]
        return shuffled
    }()
    let correctOrder: [String] = ["img1", "img2", "img3", "img4", "img5", "img6"]
    @State var draggingImage: String?
    @Binding var showAlert: Bool
    @Binding var isCorrect: Bool

    var body: some View {
        ZStack {
            VStack {
                let columns = Array(repeating: GridItem(spacing: 0), count: 1)
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(arrImages, id: \.self) { imageName in
                        GeometryReader { proxy in
                            let size = proxy.size
                            
                            Image(imageName)
                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .overlay( // Borde resaltado si es la imagen correcta
//                                    RoundedRectangle(cornerRadius: 0)
//                                        .stroke(arrImages.firstIndex(of: imageName) == correctOrder.firstIndex(of: imageName) ? Color.green : Color.clear, lineWidth: 4)
//                                )
                                .draggable(imageName) {
                                    Image(imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: size.width, height: size.height)
                                        .opacity(0.7)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .onAppear {
                                            draggingImage = imageName
                                        }
                                }
                                .dropDestination(for: String.self) { items, location in
                                    return false
                                } isTargeted: { status in
                                    if let draggingImage, status, draggingImage != imageName {
                                        if let sourceIndex = arrImages.firstIndex(of: draggingImage),
                                           let destinationIndex = arrImages.firstIndex(of: imageName) {
                                            withAnimation(.bouncy) {
                                                let sourceItem = arrImages.remove(at: sourceIndex)
                                                arrImages.insert(sourceItem, at: destinationIndex)
                                            }
                                            checkOrder() // Verificar si está en el orden correcto
                                        }
                                    }
                                }
                        }
                        .frame(height: 70)
                    }
                }
            }
            
            if showAlert{
                Rectangle()
                    .fill(.white.opacity(0.5))
            }
            
            if showAlert {
                AlertMessage(color: "green", isCorrect: $isCorrect, showAlert: $showAlert, message: ("Drag the images to the correct order", "Hola"))
            }
        }
        .frame(width: 280, height: 410)
        .padding()
    }
    
    func checkOrder() {
        if arrImages == correctOrder {
            isCorrect = true
        }
    }
}

//#Preview {
//    DragDrop()
//}
