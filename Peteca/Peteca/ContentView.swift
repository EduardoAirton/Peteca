//
//  ContentView.swift
//  Peteca
//
//  Created by Eduardo Airton on 25/03/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            
            HStack {
                ForEach(0..<5) { number in
                    Games(objects: "logo")
                }
            }
        }
        .frame(width: 1024, height: 768)
    .background(Image("playground"))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
