//
//  WebService.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 23.08.2022.
//

import Foundation

final class WebService {
    
    static let shared = WebService()
    private init(){}
    
    func getNews(completion: @escaping (Result<[Article], ServiceError>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=e57f3ba68d40431396ad251d26e32ba2") else {
            completion(.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion(.failure(.connectionError))
                return
            }
            guard let newsList = try? JSONDecoder().decode(Articles.self, from: data) else {
                completion(.failure(.generalError))
                return
            }
            completion(.success(newsList.articles))
        }.resume()
    }
}
