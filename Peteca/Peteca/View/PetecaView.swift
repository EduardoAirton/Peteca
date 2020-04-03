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
    @State private var itens = ["Couro", "Areia", "Bico", "Pena Vermelha", "Pena Azul", "Pena Amarela", "Pena Verde"]
    @State var ordemPeteca = ["Couro", "Areia", "Bico", ""]
    @State private var petecaFrames = [CGRect](repeating: .zero, count: 4)
    @State var estadoPeteca = "logo"
    
   @State var ordemMontagem = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            petecaBuild(imagem: estadoPeteca)
                .overlay(GeometryReader { geo in
                    Color.clear
                        .onAppear{
                            self.petecaFrames[0] = geo.frame(in: .global)
                        }
                    }
                )
            Spacer()
            
            HStack{
                ForEach(0..<3) { itens in
                    petecaBuild(imagem: "\(self.itens[itens])", onChanged: self.petecaMoved)
                    .overlay(
                        Color.clear
                    )
                    .zIndex(10)
                }
                
                ForEach(3..<7) { itens in
                    petecaBuild(imagem: "\(self.itens[itens])", pena: true)
                    .zIndex(1)
                }

                
                

            }
        }
        .frame(width: 1280, height: 800)
        .background(Image("Parquinho Montagem"))
    }
    
    func petecaMoved(location: CGPoint, item: String) -> MontagemPeteca {
        
        if petecaFrames.firstIndex(where: {
            $0.contains(location)}) != nil {
            
            if item == self.ordemPeteca[self.ordemMontagem] {
                return .certo
                
            }else {
                return .errado
            }
        }else {
            return .desconhecido
        }

     
    }
    func trocaImagem(item: String) -> String{
        if item == self.ordemPeteca[self.ordemMontagem] {
            return self.ordemPeteca[self.ordemMontagem + 1]
        }
        return self.ordemPeteca[self.ordemMontagem]
    }
    
//    func petecaDropped(location: CGPoint, itemPeteca: String) {
//        if petecaFrames.firstIndex(where: {
//        $0.contains(location)}) != nil {
//            self.estadoPeteca = itemPeteca
//        }
//    }

}

struct PetecaView_Previews: PreviewProvider {
    static var previews: some View {
        PetecaView(playgroundView: PlaygroundView())
    }
}

struct Peteca: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    
    @State var posicaoPeteca = CGPoint()
    @State private var petecaClicada = false
    @State var petecaBuild = false
    @State private var qtdClickPlaca = 0
    
    var body: some View{
        
        Image(petecaClicada ? "Placa" : "peteca")
            .resizable()
            .frame(width: (petecaClicada ? 230 : 125), height: (petecaClicada ? 230 : 125))
            .position(self.posicaoPeteca)
            .gesture(
                TapGesture()
                    .onEnded {_ in
                        
                        if self.petecaBuild {
                            self.playgroundView.currentPlayground = "PetecaBuild"
                        }
                        self.petecaClicada.toggle()
                        self.qtdClickPlaca += 1
                        
                        if self.qtdClickPlaca == 2 {
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


