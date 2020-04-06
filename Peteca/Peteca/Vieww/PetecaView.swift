//
//  PetecaView.swift
//  Peteca
//
//  Created by Eduardo Airton on 01/04/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

struct PetecaView: View {
    @ObservedObject var playgroundView: PlaygroundView
    @State private var ordemPena = ["Pena Vermelha", "Pena Azul", "Pena Amarela", "Pena Verde"]
    
    @State var ordemPetecaMontagem = ["Frame", "Frame2", "Frame3" ,"Peteca2"]
    @State var ordemPeteca = ["Frame2", "Areia", "Frame4", ""]
    @State private var petecaFrames = [CGRect](repeating: .zero, count: 4)
    
   @State var ordemMontagem = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
                Montagem()
                .padding(.horizontal, 200)
                .overlay(GeometryReader { geo in
                    Image(self.ordemPetecaMontagem[self.ordemMontagem])
                        .resizable()
                        .frame(width: 200, height: 285)
                        .onAppear{
                            self.petecaFrames[0] = geo.frame(in: .global)
                        }
                    }
                )
            Spacer()
            
            HStack{
                ForEach(0..<3) { itens in
                    petecaBuild(imagem: "\(self.ordemPeteca[itens])", onChanged: self.petecaMoved)
                    .overlay(
                        Color.clear
                    )
                    .zIndex(10)
                }
                ForEach(0..<4) { itens in
                    petecaBuild(imagem: "\(self.ordemPena[itens])", pena: true)
                    .zIndex(1)
                }
            }
        }
        .frame(width: 1280, height: 800)
        .background(Image("Parquinho Montagem"))
    }
    
    func petecaMoved(location: CGPoint, item: String) -> MontagemPeteca {
        
        var temp = MontagemPeteca.desconhecido
        
        if petecaFrames.firstIndex(where: {
            $0.contains(location)}) != nil {
            
            if item == self.ordemPeteca[self.ordemMontagem] {
                
                temp = .certo
                
            }else {
                temp = .errado
            }
        }else {
            temp = .desconhecido
        }
        
        if temp == .certo {
            self.ordemMontagem += 1
        }
        
        return temp
     
    }

}

struct PetecaView_Previews: PreviewProvider {
    static var previews: some View {
        PetecaView(playgroundView: PlaygroundView())
    }
}


struct Peteca: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    
    @State var posicaoPeteca = CGPoint()
    @State var imagem = ""
    @State private var petecaClicada = false
    @State var petecaBuild = false
    @State private var qtdClickPlaca = 0
    @State var tamanho = CGFloat()
    
    var body: some View{
        
        Image(self.imagem)
            .resizable()
            .frame(width: self.tamanho, height: self.tamanho )
            .position(self.posicaoPeteca)
            .gesture(
                TapGesture()
                    .onEnded {_ in
                        
                        if self.petecaBuild {
                            self.playgroundView.currentPlayground = "PetecaBuild"
                        }
                        self.qtdClickPlaca += 1
                        
                        if self.qtdClickPlaca == 1 {
                            if self.playgroundView.currentPlayground == "UserPlayground" {
                                
                                self.playgroundView.currentPlayground = "MyPlayground"
                                
                            }else if self.playgroundView.currentPlayground == "MyPlayground"{
                                
                                self.playgroundView.currentPlayground = "UserPlayground"
                            }else{

                            }
                            
                        }
                        
                        
                }
        )
    }
}


