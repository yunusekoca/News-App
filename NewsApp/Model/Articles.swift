//
//  News.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 23.08.2022.
//

import Foundation

struct Articles: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let url: String
    let urlToImage: String
    let description: String
    let publishedAt: String
}
