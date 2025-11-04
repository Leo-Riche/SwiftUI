//
//  TodoModel.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI

struct Todo: Codable, Identifiable {
    let id: Int
    let title: String
    let completed: Bool
}
