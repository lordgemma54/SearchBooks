//
//  BookCardView.swift
//  BookSearch
//
//  Created by rahul v on 11/13/26.
//

import SwiftUI

struct BookCardView: View {
    
    let book : BookModel
    @EnvironmentObject private var books : BooksViewModel
    
    var body: some View {
        HStack {
            Image(book.imageLinks.sThumb) // small thumbnail
            Text("Title", book.title)
            Text("Author", book.authors)
        }
    }
}

#Preview {
    BookCardView()
}
