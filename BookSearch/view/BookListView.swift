//
//  BookListView.swift
//  BookSearch
//
//  Created by rahul v on 11/13/26.
//

import SwiftUI

struct BookListView: View {
    
    @State var searchTerm : String = ""
    @EnvironmentObject var books : BooksViewModel
    @EnvironmentObject var authvm : AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search books or authors", text: $searchTerm)
                    .textFieldStyle(.roundedBorder)
                
                Button("Search") {
                    Task {
                        await books.fetchBooks(searchTerm: searchTerm)
                    }
                }
                .disabled(searchTerm.trimmingCharacters(in: .whitespaces).isEmpty)
            }
            .padding()
            
            
            
            if books.isLoading {
                ProgressView()
            } else if let error = books.errorMsg {
                Text(error)
                    .foregroundStyle(.red)
                    .padding()
            } else {
                List {
                    Section("Matching Titles") {
                        ForEach(books.titleResults) { book in
                            NavigationLink {
                                BookDetailView(book : book)
                            } label: {
                                BookCardView(book : book)
                            }
                        }
                    }
                    
                    Section("Matching Authors") {
                        ForEach(books.authorResults) { book in
                            NavigationLink {
                                BookDetailView(book : book)
                            } label: {
                                BookCardView(book : book)
                            }
                        }
                    }
                    
                }
                .listStyle(.insetGrouped)
            }
            Spacer()
            Button("Log out") {
                authvm.logout()
            }
        }
        .navigationTitle("Book Search")
    }
}

#Preview {
    BookListView()
        .environmentObject(BooksViewModel())
}
