//
//  BookModel.swift
//  BookSearch
//
//  Created by rahul v on 11/11/26.
//

import Foundation

struct BookModel : Codable, Identifiable {
    var id : String
    
    let volumeInfo : VolumeInfo
    
}

struct VolumeInfo : Codable {
    let title : String?
    let authors : [String]?
    
    let publisher : String?
    let publishedDate : String?
    
    let description : String?
    let pageCount : Int?
    let categories : [String]?
    
    let averageRating : Double?
    let ratingsCount : Int?
    
    let imageLinks : ImageLinks?

}

struct ImageLinks : Codable {
    let smallThumbnail : String?
    let thumbnail : String?
    
//    var sThumb : String
//    var thumb : String
//    
//    enum CodingKeys : String, CodingKey {
//        case sThumb = "smallThumbnail"
//        case thumb = "thumbnail"
//    }
}


