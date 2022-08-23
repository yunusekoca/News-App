//
//  ServiceError.swift
//  NewsApp
//
//  Created by Yunus Emre Koca on 23.08.2022.
//

import Foundation

enum ServiceError: Error {
    case connectionError, generalError, urlError
}

extension ServiceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .connectionError:
            return "Bağlantı hatası"
        case .generalError:
            return "Genel hata"
        case .urlError:
            return "URL hatası"
        }
    }
}
