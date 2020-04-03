//
//  MyPlayground.swift
//  Peteca
//
//  Created by Eduardo Airton on 30/03/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

struct MyPlayground: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    @State private var posicaoPeteca = CGPoint(x: 350, y: 100)
    
    var body: some View {
        VStack(spacing: 10) {
            
            Placa(playgroundView: playgroundView)
            
            Peteca(playgroundView: playgroundView, posicaoPeteca: posicaoPeteca, petecaBuild: true)
            
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
    
    var body: some View{
        Image("Placa")
            .resizable()
            .frame(width: 230, height: 230)
            .position(self.posicaoPlaca)
            .gesture(
                TapGesture()
                    .onEnded {_ in
                        self.playgroundView.currentPlayground = "UserPlayground"
                }
        )
    }
}


