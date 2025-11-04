//
//  Todo.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI

@Observable
class TodoViewModel {
    var todo: Todo?
    var counter: Int = 1
    
    func fetchTodo() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/\(counter)") else {
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return
            }
            
            let decoded = try JSONDecoder().decode(Todo.self, from: data)
            todo = decoded
        } catch {
            print("Erreur : \(error.localizedDescription)")
        }
    }
    
    func add() async {
        counter += 1
        await fetchTodo()
    }
}
