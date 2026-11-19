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
    
//   handles ingestion of credentials
//    sends these to firebase
//    manages user session
    func loginUser (email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
    }
}
