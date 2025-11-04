//
//  SwiftUI_InitApp.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI

@main
struct SwiftUI_InitApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                NavigationLink("Aller au compteur") {
                    CounterView()
                }
                NavigationLink("Aller au profil") {
                    ProfileView()
                }
                NavigationLink("Aller au fetch") {
                    TodoView()
                }
            }
            .navigationTitle("Accueil")
        }
    }
}
