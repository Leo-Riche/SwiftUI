//
//  TodoView.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI

struct TodoView: View {
    @State var todoModel = TodoViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            if let todo = todoModel.todo {
                Text("ID : \(todo.id)")
                Text("Titre : \(todo.title)")
                Text("Complété : \(todo.completed.description)")
            } else {
                Text("Chargement...")
            }
            
            Button("Add 1") {
                Task {
                    await todoModel.add()
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.second)
            
            Text("Compteur : \(todoModel.counter)")
                .padding(8)
                .border(Color.main, width: 2)
        }
        .padding()
        .task {
            await todoModel.fetchTodo()
        }
    }
}

#Preview {
    TodoView()
}
