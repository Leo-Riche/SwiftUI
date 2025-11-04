//
//  ProfileViewModel.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI
import PhotosUI

@Observable
class ProfileViewModel {
    var firstName: String = "John"
    var lastName: String = "Doe"
    var avatar: UIImage?    // Remplace FILE par UIImage
    
    func updateFirstName(to newFirstName: String) {
        firstName = newFirstName
    }
    
    func updateLastName(to newLastName: String) {
        lastName = newLastName
    }
    
    func updateAvatar(to newAvatar: UIImage?) {
        avatar = newAvatar
    }
}
