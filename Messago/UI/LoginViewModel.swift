//
//  LoginViewModel.swift
//  Messago
//
//  Created by Mohamed El hanafi on 04/01/2025.
//

import SwiftUI
import FirebaseAuth

@Observable final class LoginViewModel {
    var email = ""
    var password = ""
    var errorMessage = "" {
        didSet {
            errorIsPresented = !errorMessage.isEmpty
        }
    }
    
    var errorIsPresented = false
    
    func signIn() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Empty fields"
            return
        }
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
        } catch {
            errorMessage = error.localizedDescription
            print(error.localizedDescription)
        }
    }
}
