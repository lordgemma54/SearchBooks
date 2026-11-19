//
//  AuthViewModel.swift
//  BookSearch
//
//  Created by rahul v on 11/19/26.
//

import Foundation
import Combine
import FirebaseAuth
//Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//  // ...
//}

class AuthViewModel : ObservableObject {
    
//    handles ingestion of credentials
//    sends credentials to firebase
//    manages user session
    @Published var isLoggedIn : Bool = false
    @Published var errMsg : String = ""
    
//    checks if firebase already has a cached session on the device
    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
    }
    
    func createUser (email: String, password: String, confPassword: String) {
        errMsg = ""
      
        guard !email.isEmpty, !password.isEmpty else {
            errMsg = "Please enter an email and password"
            return
        }
        
        guard password == confPassword else {
            errMsg = "Passwords do not match"
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errMsg = error.localizedDescription
                return
            }
            self?.isLoggedIn = true
        }
    }
    
    
    func loginUser (email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                self?.errMsg = error.localizedDescription
                return
            }
            self?.isLoggedIn = true
        }
    }
    
    
    func logout() {
        try? Auth.auth().signOut()
        self.isLoggedIn = false
    }
}
