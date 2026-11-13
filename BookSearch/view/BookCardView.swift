//
//  BookCardView.swift
//  BookSearch
//
//  Created by rahul v on 11/13/26.
//

import SwiftUI

struct BookCardView: View {
    
    let book : BookModel
//    @EnvironmentObject private var books : BooksViewModel
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: book.volumeInfo.imageLinks?.smallThumbnail ?? "")
            ) {
                image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "book.closed")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .frame(width: 65, height: 90)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(book.volumeInfo.title ?? "Unknown Title")
                    .font(.headline)
                
                Text(book.volumeInfo.authors?.joined(separator: ", ") ?? "Unknown Author")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(publicationYear)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
    
    private var publicationYear : String {
        guard let date = book.volumeInfo.publishedDate else {
            return "Unknown Year"
        }
        return String(date)
    }
    
}

//#Preview {
//    BookCardView()
//}
