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
    @State var confPassword : String = ""
    @State var isCreatingAccount : Bool = false
    @EnvironmentObject var authvm : AuthViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text(isCreatingAccount ? "Create Account" : "Welcome Back!")
                .font(.largeTitle)
//                .fontWeight(.bold)
            
            Picker("Mode", selection: $isCreatingAccount) {
                Text("Log In").tag(false)
                Text("Sign up").tag(true)
            }
            .pickerStyle(.segmented)
            .onChange(of: isCreatingAccount) {
                confPassword = ""
                authvm.errMsg = ""
            }
            
            
            TextField("Enter email", text: $email)
                .textFieldStyle(.roundedBorder)
            
           SecureField("Enter password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            if isCreatingAccount {
                SecureField("Confirm password", text: $confPassword)
                    .textFieldStyle(.roundedBorder)
            }
            
            if !authvm.errMsg.isEmpty {
                Text(authvm.errMsg)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(isCreatingAccount ? "Create" : "Login") {
                if isCreatingAccount {
                    authvm.createUser(
                        email: email,
                        password: password,
                        confPassword: confPassword)
                } else {
                    authvm.loginUser(email: email, password: password)
                }
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
        .padding()
        .animation(.default, value: isCreatingAccount)
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())

}
