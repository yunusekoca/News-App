//
//  NewsDetailsVM.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 25.08.2022.
//

import Foundation

final class NewsDetailsViewModel {
    
    private let model: Article
    private let dateFormatter: DateFormatter
    
    init(article: Article) {
        model = article
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    }
    
    var title: String {
        return model.title
    }
    
    var description: String {
        return model.description
    }
    
    var publishedAt: String? {
        let date = dateFormatter.date(from: model.publishedAt)
        return date?.formatted(date: Date.FormatStyle.DateStyle.abbreviated, time: Date.FormatStyle.TimeStyle.standard)
    }
    
    var imageURL: URL? {
        return URL(string: model.urlToImage)
    }
    
    var readMoreLink: URL? {
        return URL(string: model.url)
    }
}
