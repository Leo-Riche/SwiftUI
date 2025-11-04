//
//  CounterView.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI

struct CounterView: View {
    @State var counterViewModel = CounterViewModel();
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(counterViewModel.counter)")
            Button("Add 10") {counterViewModel.add()}
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.large)
            Button("Reset") {counterViewModel.reset()}
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .controlSize(.large)
        }
        .padding()
    }
}

#Preview {
    CounterView()
}
