import Foundation
import SwiftUI

public struct MyPlayground: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    @State private var posicaoPeteca = CGPoint(x: 750, y: 100)
    
    public var body: some View {
        VStack(spacing: 10) {
            
            Placa(playgroundView: playgroundView, imagem: "Placa 2")
            
            Peteca(playgroundView: playgroundView, posicaoPeteca: posicaoPeteca, tamanho: 80, imagem: "PetecaMontada", petecaBuild: true)
                
            
            Image("peteca")
                .resizable()
                .frame(width: 125, height: 125)
                .position(x: 700, y: 10)
        }
        .frame(width: 1280, height: 800)
        .background(Image("Parquinho 2"))
    }
}

struct MyPlayground_Previews: PreviewProvider {
    static var previews: some View {
        MyPlayground(playgroundView: PlaygroundView())
    }
}

struct Placa: View {
    @State private var posicaoPlaca = CGPoint(x: 350, y: 200)
    @ObservedObject var playgroundView: PlaygroundView
    @State var imagem = ""
    
    var body: some View{
        Image(self.imagem)
            .resizable()
            .frame(width: 200, height: 200)
            .position(self.posicaoPlaca)
            .gesture(
                TapGesture()
                    .onEnded {_ in
                        self.playgroundView.currentPlayground = "UserPlayground"
                }
        )
    }
}



