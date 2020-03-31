//
//  PlaygroundView.swift
//  Peteca
//
//  Created by Eduardo Airton on 31/03/20.
//  Copyright © 2020 Eduardo Airton. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PlaygroundView: ObservableObject {
    
    let objectWillChange = PassthroughSubject<PlaygroundView,Never>()
    
    var currentPlayground: String = "UserPlayground" {
        didSet {
            objectWillChange.send(self)
        }
    }
}
