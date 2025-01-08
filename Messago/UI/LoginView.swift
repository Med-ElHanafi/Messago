//
//  LoginView.swift
//  Messago
//
//  Created by Mohamed El hanafi on 31/12/2024.
//

import SwiftUI

struct LoginView: View {
    @FocusState private var focusedInput: Field?
    
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        ScrollView {
            logoBanner
            
            VStack(spacing: 30) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .padding(.vertical)
                
                emailTextField
                    .focused($focusedInput, equals: .email)
                
                passwordTextField
                    .focused($focusedInput, equals: .password)
                
                loginButton
                
                signupButton
            }
            .padding()
            .background(.white)
            .clipShape(CustomRoundedRectangle(corner: .topLeft, radius: 50))
            .offset(y: -60)
        }
        .ignoresSafeArea(.container, edges: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button(action: focusNextField) {
                    Image(systemName: "chevron.down")
                }
            }
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedInput = nil
                }
            }
        }
        .alert("Signin error", isPresented: $viewModel.errorIsPresented) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

private extension LoginView {
    private var logoBanner: some View {
        VStack {
            Image(.logo)
                .resizable()
                .frame(width: 150, height: 150)
                .padding(50)
                .background(.accent)
        }
        .frame(maxWidth: .infinity)
        .background(.accent)
    }
    
    private var emailTextField: some View {
        CustomTextField(
            text: $viewModel.email,
            title: "Email",
            placeholder: "example@email.com"
        )
    }
    
    private var passwordTextField: some View {
        CustomTextField(
            text: $viewModel.password,
            title: "Password",
            placeholder: "•••••••••••",
            secure: true
        )
    }
    
    private var loginButton: some View {
        Button("Login") {
            Task {
                await viewModel.signIn()
            }
        }
        .padding(.vertical, 20)
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity)
        .background(.accent)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var signupButton: some View {
        Button("Don't have an account? Sign up") {
        }
        .fontWeight(.medium)
        .frame(maxWidth: .infinity)
    }
}

private extension LoginView {
    func focusNextField() {
        focusedInput = focusedInput.map {
            Field(rawValue: $0.rawValue + 1) ?? .email
        }
    }
}

#Preview {
    LoginView()
}
