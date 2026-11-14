//
//  BooksViewModel.swift
//  BookSearch
//
//  Created by rahul v on 11/13/26.
//

import Foundation
import Combine

@MainActor
class BooksViewModel : ObservableObject {
  
//    should accept a search term
//    make api request
//    decode api response
//    publish the search results as book objects to use in view
    
    @Published var titleResults : [BookModel] = []
    @Published var authorResults : [BookModel] = []
    @Published var isLoading = false
    @Published var errorMsg: String?

    //    @MainActor
    func fetchBooks(searchTerm : String) async {
        
        guard !searchTerm.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        isLoading = true
        errorMsg = nil
        
        do {
            titleResults = try await searchBooks(
                query: "intitle:\(searchTerm)"
            )
            
            authorResults = try await searchBooks(
                query: "inauthor:\(searchTerm)"
            )
        } catch {
            errorMsg = error.localizedDescription
        }
        isLoading = false


        }
    
    private func searchBooks(query : String) async throws -> [BookModel]{
        let baseUrl = "https://www.googleapis.com/books/v1/volumes"
        let apiKey = "AIzaSyCxeUenZnLO00JzIRqJnoX84UL-ObK6RUg"
        
        guard var components = URLComponents(string : baseUrl) else {
            throw URLError(.badURL)
        }
        
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "maxResults", value: "20"),
            URLQueryItem(name: "langRestrict", value: "en")
            ]
        
        guard let url = components.url else { throw URLError(.badURL) }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decodedResponse = try JSONDecoder().decode(BooksAPIResponse.self, from: data)
        
        return decodedResponse.items ?? []
    }
    
    
    
    
    struct BooksAPIResponse : Codable {
        let items : [BookModel]?
    }
    }
