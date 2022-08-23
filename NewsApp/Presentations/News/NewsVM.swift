//
//  NewsVM.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 23.08.2022.
//

import Foundation

final class NewsViewModel {
    
    var newsFetched: (([Article]) -> Void)?
    var errorOccurred: ((String) -> Void)?
    
    func getArticles() {
        WebService.shared.getNews { [weak self] result in
            switch result {
            case .success(let news):
                self?.newsFetched?(news)
            case .failure(let error):
                self?.errorOccurred?(error.localizedDescription)
            }
        }
    }
}
