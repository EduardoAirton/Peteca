//
//  Games.swift
//  Peteca
//
//  Created by Eduardo Airton on 25/03/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import SwiftUI

struct Games: View {
    @State private var dragAmount = CGSize.zero

    
    var objects: String
    var shadowColor = Color.black
    
    var body: some View {
        Image(objects)
            .resizable()
            .frame(width: 125, height: 125)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 1)
            .shadow(color: self.shadowColor, radius: self.dragAmount == .zero ? 0 : 10)
            .shadow(color: self.shadowColor, radius: self.dragAmount == .zero ? 0 : 10)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                    }
            )
            
    }
    
    func petecaAnimation() {
        
    }
    

}

struct Games_Previews: PreviewProvider {
    static var previews: some View {
       Games(objects: "logo")
    }
}
