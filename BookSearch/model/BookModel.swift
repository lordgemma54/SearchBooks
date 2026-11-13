//
//  BookModel.swift
//  BookSearch
//
//  Created by rahul v on 11/11/26.
//

import Foundation

struct BookModel : Codable, Identifiable {
    var id : String
    var title : String
    var authors : [Authors]
    var publisher : String
    var publishedDate : String
    var description : String
    var pageCount : Int
    var categories : [String]
    var averageRating : Int
    var ratingsCount : Int
    var imageLinks : [ImageModel]
}

struct Authors : Codable {
    var authors : [String]
}

struct Categories : Codable {
    var categories : [String]
}

struct ImageModel : Codable {
    var sThumb : String
    var thumb : String
    
    enum CodingKeys : String, CodingKey {
        case sThumb = "smallThumbnail"
        case thumb = "Thumbnail"
    }
}


