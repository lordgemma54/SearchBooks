//
//  BookModel.swift
//  BookSearch
//
//  Created by rahul v on 11/11/26.
//

import Foundation

struct BookModel : Identifiable {
    
    var title : String
    var authors : [String]
    var publisher : String
    var publishedDate : String
    var description : String
    var pageCount : Int
    var categories : [String]
    var averageRating : Int
    var ratingsCount : Int
    var imageLinks : [String]
    
}
