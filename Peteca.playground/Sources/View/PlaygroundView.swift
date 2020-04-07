import Foundation
import SwiftUI
import Combine


public class PlaygroundView: ObservableObject {
    
    public let objectWillChange = PassthroughSubject<PlaygroundView,Never>()
    
    public init() {}
    
    public var currentPlayground: String = "UserPlayground" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
