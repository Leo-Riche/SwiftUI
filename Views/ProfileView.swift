//
//  ProfileView.swift
//  SwiftUI_Init
//
//  Created by RICHÉ Léo on 03/11/2025.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State var profile = ProfileViewModel()
    @State private var newFirstName = ""
    @State private var newLastName = ""
    @State private var avatarItem: PhotosPickerItem?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack(spacing: 120) {
                HStack(spacing: 20) {
                    if let avatar = profile.avatar {
                        Image(uiImage: avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundStyle(.gray)
                    }
                    Text("Profil")
                        .font(.title)
                        .bold()
                }
                Button("Modifier") {
                    profile.updateFirstName(to: newFirstName)
                    profile.updateLastName(to: newLastName)
                }
                .buttonStyle(.borderedProminent)
            }
            PhotosPicker(selection: $avatarItem, matching: .images) {
                Text("Sélectionner un avatar")
            }
            .onChange(of: avatarItem) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        profile.updateAvatar(to: uiImage)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Prénom : \(profile.firstName)")
                Text("Nom : \(profile.lastName)")
            }
            VStack(alignment: .leading, spacing: 10) {
                TextField("Nouveau prénom", text: $newFirstName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
                TextField("Nouveau nom", text: $newLastName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 150)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
