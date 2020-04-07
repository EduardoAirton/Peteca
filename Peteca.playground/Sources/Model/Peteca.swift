import Foundation
import SwiftUI

public enum MontagemPeteca {
    case desconhecido
    case certo
    case errado
}

public struct petecaBuild: View {
    
    @State private var dragAmount = CGSize.zero
    @State private var montagemPeteca = MontagemPeteca.desconhecido

    @State private var petecaFrames = [CGRect](repeating: .zero, count: 4)
        
    @State var imagem = ""
    @State var pena = false
    
    var onChanged: ((CGPoint, String) -> MontagemPeteca)?
    
    public init(imagem: String,onChanged:((CGPoint, String) -> MontagemPeteca)?, pena: Bool) {
        self.imagem = imagem
        self.pena = pena
    }
    
    public var body: some View {
        Image(self.imagem)
            .resizable()
            .frame(width: 166, height: 141)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 1)
            .shadow(color: dragColor, radius: dragAmount == .zero ? 0 : 10)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                        self.montagemPeteca = self.onChanged?($0.location, self.imagem) ?? .desconhecido
                    }
                    .onEnded {_ in
                        if !self.pena {
                            self.dragAmount = .zero
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

public struct Montagem: View{
    public init(){}
    public var body: some View {
        Rectangle()
            .fill(Color.clear)
            .frame(width: 100, height: 185, alignment: .center)
            
    }
}

