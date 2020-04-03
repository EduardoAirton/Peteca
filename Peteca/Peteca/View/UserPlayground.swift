//
//  UserPlayground.swift
//  Peteca
//
//  Created by Eduardo Airton on 31/03/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

struct UserPlayground: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    var posicaoPeteca = CGPoint(x: 350, y: 200)
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Spacer()
            
            Peteca(playgroundView: playgroundView, posicaoPeteca: posicaoPeteca)
            
            HStack {
                ForEach(0..<5) { number in
                    Games(objects: "logo")
                        .padding(.bottom, 35)
                }
                
                Games(objects: "logo")
                    .overlay(Color.black)
                    .cornerRadius(20)
                    .padding(.bottom, 35)
            }
        }
        .frame(width: 1280, height: 800)
        .background(Image("Parquinho"))
        
    }
}

struct UserPlayground_Previews: PreviewProvider {
    static var previews: some View {
        UserPlayground(playgroundView: PlaygroundView())
    }
}


