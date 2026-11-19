//
//  LoginView.swift
//  BookSearch
//
//  Created by rahul v on 11/19/26.
//

import SwiftUI
//import FirebaseCore
//import FirebaseFirestore
//import FirebaseAuth



struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    
    @EnvironmentObject var authvm : AuthViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter email", text: $email)
                .fontWeight(.bold)
                .textFieldStyle(.roundedBorder)
            
           SecureField("Enter password", text: $password)
                .fontWeight(.bold)
                .textFieldStyle(.roundedBorder)
            
            Button("Login") {
                authvm.loginUser(email: email, password: password)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())

}
