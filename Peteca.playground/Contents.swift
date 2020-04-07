import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var playgroundView = PlaygroundView()
    
    var body: some View {
        VStack{
            if playgroundView.currentPlayground == "UserPlayground" {
                UserPlayground(playgroundView: playgroundView)
            }
        }
    }

}

PlaygroundPage.current.setLiveView(ContentView(playgroundView: PlaygroundView()))
