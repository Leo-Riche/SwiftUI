//
//  AnimatedTextField.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 04/11/2025.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var highlightColor: Color = .blue
    var width: CGFloat = 200

    @FocusState private var isFocused: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField(placeholder, text: $text)
                .focused($isFocused)
                .padding(.vertical, 8)
                .animation(.easeInOut, value: isFocused)

            Rectangle()
                .frame(height: 2)
                .foregroundColor(isFocused ? highlightColor : .gray.opacity(0.4))
                .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
        .frame(width: width)
    }
}
