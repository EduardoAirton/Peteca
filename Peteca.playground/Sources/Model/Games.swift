import Foundation
import SwiftUI

public struct Games: View {
    @State private var dragAmount = CGSize.zero

    
    var objects: String
    var shadowColor = Color.black
    
    public init(objects: String) {
        self.objects = objects
    }
    
    public var body: some View {
        Image(objects)
            .resizable()
            .frame(width: 173, height: 171)
            .offset(dragAmount)
            .zIndex(dragAmount == .zero ? 0 : 1)
            .gesture(
                DragGesture(coordinateSpace: .global)
                    .onChanged {
                        self.dragAmount = CGSize(width: $0.translation.width, height: -$0.translation.height)
                    }
            )
            
    }
}

struct Games_Previews: PreviewProvider {
    static var previews: some View {
       Games(objects: "logo")
    }
}

