//
//  BookSearchApp.swift
//  BookSearch
//
//  Created by rahul v on 11/11/26.
//

import SwiftUI

@main
struct BookSearchApp: App {
    
    @StateObject var books = BooksViewModel()
    
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(books)
        }
    }
}
