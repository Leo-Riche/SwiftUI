//
//  CounterView.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI
import DesignSystem

struct CounterView: View {
    @State var counterViewModel = CounterViewModel();
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(counterViewModel.counter)")
            AnimatedButton(title: "Ajouter", color: .second) {counterViewModel.add()}
            AnimatedButton(title: "Réinitialiser", color: .main) {counterViewModel.reset()}
        }
        .padding()
    }
}

#Preview {
    CounterView()
}
