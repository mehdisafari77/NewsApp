//
//  Article.swift
//  NewsApp
//
//  Created by Mehdi MMS on 23/03/2022.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article {
    
    let source: Source
    
    let title: String
    let url: String
    let publishedAt: Date
    
    let author: String?
    let description: String?
    let urlToImage: String?
        
    var authorText: String {
        author ?? ""
    }
}
