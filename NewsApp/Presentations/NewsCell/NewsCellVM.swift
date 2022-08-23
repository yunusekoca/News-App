//
//  NewsCellVM.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 23.08.2022.
//

import Foundation

final class NewsCellViewModel {
    
    private let responseModel: Article
    
    init(model: Article) {
        responseModel = model
    }
    
    var title: String {
        return responseModel.title
    }
    
    var description: String {
        return responseModel.description
    }
    
    var url: URL? {
        return URL(string: responseModel.urlToImage)
    }
}
