//
//  ContentView.swift
//  Peteca
//
//  Created by Eduardo Airton on 31/03/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var playgroundView: PlaygroundView
    
    var body: some View {
        VStack{
            if playgroundView.currentPlayground == "UserPlayground" {
                UserPlayground(playgroundView: playgroundView)
            }else if playgroundView.currentPlayground == "MyPlayground"{
                MyPlayground(playgroundView: playgroundView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(playgroundView: PlaygroundView())
    }
}
