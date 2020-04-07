import Foundation
import PlaygroundSupport
import SwiftUI

public struct UserPlayground: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    @State public var jogos = ["Queimada", "Bete", "Pular Corda", "Amarelinha", "Pique Esconde"]
    
    public var posicaoPeteca = CGPoint(x: 500, y: -215)
    
    public init (playgroundView: PlaygroundView) {
        self.playgroundView = playgroundView
    }
    
    public var body: some View {
        
        VStack(spacing: 20) {
            
            Spacer()
            
            Image("Abelha")
                .resizable()
                .frame(width: 60, height: 50)
                .position(x: 200, y: 140)
                
            
            Peteca(playgroundView: playgroundView, posicaoPeteca: posicaoPeteca, tamanho: 180, imagem: "Placa", petecaBuild: false)
            
            HStack {
                ForEach(0..<5) { number in
                    Games(objects: self.jogos[number])
                        .padding(.bottom, 35)
                }
                
//                Games(objects: "logo")
//                    .overlay(Color.black)
//                    .cornerRadius(20)
//                    .padding(.bottom, 35)
            }
        }
        .frame(width: 1280, height: 800)
        .background(Image("Parquinho"))
        
    }
}

public struct UserPlayground_Previews: PreviewProvider {
    public static var previews: some View {
        UserPlayground(playgroundView: PlaygroundView())
    }
}
