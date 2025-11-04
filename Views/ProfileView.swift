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
        enum Field {
            case firstName
            case lastName
        }
    
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
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                        isPressed = true
                    }
                    profile.updateFirstName(to: newFirstName)
                    profile.updateLastName(to: newLastName)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                            isPressed = false
                        }
                    }
                }) {
                    Text("Modifier")
                        .bold()
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color("Second"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .scaleEffect(isPressed ? 0.9 : 1.0)
                        .shadow(radius: isPressed ? 2 : 5)
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
                VStack(alignment: .leading, spacing: 5) {
                    TextField("Nouveau prénom", text: $newFirstName)
                        .focused($focusedField, equals: .firstName)
                        .animation(.easeInOut, value: focusedField)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(focusedField == .firstName ? .second : .gray.opacity(0.4))
                        .animation(.easeInOut(duration: 0.2), value: focusedField)
                }
                .frame(width: 200)
                VStack(alignment: .leading, spacing: 5) {
                    TextField("Nouveau nom", text: $newLastName)
                        .focused($focusedField, equals: .lastName)
                        .animation(.easeInOut, value: focusedField)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(focusedField == .lastName ? .second : .gray.opacity(0.4))
                        .animation(.easeInOut(duration: 0.2), value: focusedField)
                }
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
