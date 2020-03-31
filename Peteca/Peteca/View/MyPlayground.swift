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
    @State var posicaoPeteca = CGPoint(x: 350, y: 200)
    
    var body: some View {
        VStack(spacing: 10) {
            Peteca(playgroundView: playgroundView, posicaoPeteca: posicaoPeteca)
    
            Image("peteca")
            .resizable()
            .frame(width: 125, height: 125)
            .position(x: 600, y: 100)
            
            Image("peteca")
            .resizable()
            .frame(width: 125, height: 125)
            .position(x: 700, y: 10)
        }
        .frame(width: 1280, height: 800)
        .background(Image("Parquinho"))
    }
}

struct MyPlayground_Previews: PreviewProvider {
    static var previews: some View {
        MyPlayground(playgroundView: PlaygroundView())
    }
}


