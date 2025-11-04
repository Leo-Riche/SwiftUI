//
//  Counter.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI

@Observable
class CounterViewModel {
    var counter: Int = 0;
    
    func add() {
        counter += 10;
    }
    
    func reset() {
        counter = 0;
    }
}
