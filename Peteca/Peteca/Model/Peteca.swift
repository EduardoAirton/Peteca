//
//  Peteca.swift
//  Peteca
//
//  Created by Eduardo Airton on 01/04/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

enum MontagemPeteca {
    case desconhecido
    case certo
    case errado
}

struct petecaBuild: View {
    
    @State private var dragAmount = CGSize()
    @State private var montagemPeteca = MontagemPeteca.desconhecido
    
    @State private var petecaFrames = [CGRect](repeating: .zero, count: 4)
        
    @State var imagem = ""
    @State var pena = false
    
    var onChanged: ((CGPoint, String) -> MontagemPeteca)?
    var onEnded: ((CGPoint, String) -> Void)?
    var onEndedPena: ((String) -> Void)?
    
    var body: some View {
        Image(self.imagem)
            .resizable()
            .frame(width: 125, height: 125)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 1)
            .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                        self.montagemPeteca = self.onChanged?($0.location, self.imagem) ?? .desconhecido
                    }
                    .onEnded {
                        if !self.pena {
                            self.dragAmount = .zero
                        }else {
                            self.onEndedPena?(self.imagem)
                        }
                        if self.montagemPeteca == .certo {
                            self.onEnded?($0.location, self.imagem)
                        }
                        
                        
                        
                    }
            )
        
    }
    
    var dragColor: Color {
        switch montagemPeteca {
        case .desconhecido:
            return .black
        case .certo:
            return .green
        case .errado:
            return .red
        }
    }
}
