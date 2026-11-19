//
//  BookSearchApp.swift
//  BookSearch
//
//  Created by rahul v on 11/11/26.
//

import SwiftUI

import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct BookSearchApp: App {
    
// -------------------- copied from firebase --------------------
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var books = BooksViewModel()
    @StateObject var authvm = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            if authvm.isLoggedIn {
                BookListView()
                    .environmentObject(books)
                    .environmentObject(authvm)
            } else {
                LoginView()
                    .environmentObject(authvm)
            }
            
        }
    }
}
