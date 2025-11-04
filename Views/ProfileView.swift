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
    @State private var isPressed = false
    @FocusState private var focusedField: Field?
    enum Field { case firstName, lastName }
    
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
                        Image(.thumb1920365606)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                            .foregroundStyle(.gray)
                            .clipShape(Circle())
                    }
                    Text("Profil")
                        .font(.title)
                        .bold()
                }
                AnimatedButton(title: "Modifier", color: .second) {
                    profile.updateFirstName(to: newFirstName)
                    profile.updateLastName(to: newLastName)
                }
            }
            PhotosPicker(selection: $avatarItem, matching: .images) {
                Text("Sélectionner un avatar")
                    .underline()
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
                CustomTextField(
                    placeholder: "Nouveau prénom",
                    text: $newFirstName,
                    highlightColor: .second
                )
                .frame(width: 200)
                CustomTextField(
                    placeholder: "Nouveau nom",
                    text: $newLastName,
                    highlightColor: .second
                )
                .frame(width: 200)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
