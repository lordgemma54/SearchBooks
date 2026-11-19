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
    
    var body: some Scene {
        WindowGroup {
//            LoginView()
//                .environmentObject()
            BookListView()
                .environmentObject(books)
        }
    }
}
