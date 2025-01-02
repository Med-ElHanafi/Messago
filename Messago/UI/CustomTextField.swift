//
//  CustomTextField.swift
//  Messago
//
//  Created by Mohamed El hanafi on 02/01/2025.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    var secure = false
    
    var cornerRadius = 10.0
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.medium)
                
                Group {
                    if secure {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
                .foregroundStyle(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color(.white).shadow(.drop(color: .gray.opacity(0.2), radius: 10)))
            )
        }
}

#Preview {
    CustomTextField(
        text: .constant("cdcd"),
        title: "Email",
        placeholder: "Enter your username"
    )
}
