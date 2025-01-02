//
//  LoginView.swift
//  Messago
//
//  Created by Mohamed El hanafi on 31/12/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(50)
                    .background(.accent)
            }
            .frame(maxWidth: .infinity)
            .background(.accent)
            
            
            VStack(spacing: 30) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.vertical, 60)
                
                CustomTextField(
                    text: .constant(""),
                    title: "Email",
                    placeholder: "example@email.com"
                )
                
                CustomTextField(
                    text: .constant(""),
                    title: "Password",
                    placeholder: "•••••••••••",
                    secure: true
                )
                
                Button("Login") {
                    
                }
                .padding(.vertical, 20)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button("Don't have an account? Sign up") {
                    
                }
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(.white)
            .clipShape(CustomRoundedRectangle(corner: .topLeft, radius: 50))
            .offset(y: -60)
        }
        .frame(maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
}
