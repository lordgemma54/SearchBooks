//
//  BookDetailView.swift
//  BookSearch
//
//  Created by rahul v on 11/13/26.
//

import SwiftUI

struct BookDetailView: View {
    
    var book : BookModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                AsyncImage(
                    url: URL(string: book.volumeInfo.imageLinks?.thumbnail ?? "")
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                
                }placeholder : {
                    Image(systemName: "book.closed")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 250)
                
                Text(book.volumeInfo.title ?? "Unknown Title")
                    .font(.title2)
                    .bold()
                
                Text(book.volumeInfo.authors?.joined(separator: ", ") ?? "Unknown Author")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("Publisher : \(book.volumeInfo.publisher ?? "Unknown")")
                Text("Published : \(book.volumeInfo.publishedDate ?? "Unknown")")
                
                if let pageCount = book.volumeInfo.pageCount {
                    Text("Page Count: \(pageCount)")
                } else {
                    Text("Page Coung: Unknown")
                }
                
                Text("Categories : \(book.volumeInfo.categories?.joined(separator: ", ") ?? "Unknown")")
                if let rating = book.volumeInfo.averageRating {
                    Text("Rating \(rating)/5")
                }
                
                Divider()
                Text("Description")
                    .font(.headline)
                
                Text(book.volumeInfo.description ?? "No Description Available")
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    BookDetailView()
//}
