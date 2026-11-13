//
//  BookListView.swift
//  BookSearch
//
//  Created by rahul v on 11/13/26.
//

import SwiftUI

struct BookListView: View {
    
    @State var searchTerm : String
    @EnvironmentObject var books : BooksViewModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

//#Preview {
//    BookListView()
//}
