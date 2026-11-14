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
                    url: URL(string: (book.volumeInfo.imageLinks?.thumbnail ?? "").replacingOccurrences(of: "http://", with: "https://"))
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
                
                Text("Publisher: ").bold() + Text(book.volumeInfo.publisher ?? "Unknown")
                Text("Published: ").bold() + Text(book.volumeInfo.publishedDate ?? "Unknown")
                
                if let pageCount = book.volumeInfo.pageCount {
                    Text("Page Count: ").bold() + Text("\(pageCount)")
                } else {
                    Text("Page Count: ").bold() + Text("Unknown")
                }
                
                Text("Categories: ").bold() + Text(book.volumeInfo.categories?.joined(separator: ", ") ?? "Unknown")
                
                
                if let rating = book.volumeInfo.averageRating {
                    let fmtRating = rating.formatted(.number.precision(.fractionLength(2)))
                    
                    if let rtgCount = book.volumeInfo.ratingsCount {
                        Text("Rating: ").bold() + Text("\(fmtRating)/5 (\(rtgCount))")
                    }else {
                        Text("Rating: ").bold() + Text("\(fmtRating)/5")
                    }
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
