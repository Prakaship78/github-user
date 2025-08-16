//
//  GHError.swift
//  GithubUser
//
//  Created by Prakash on 14/08/25.
//


enum GHError : String, Error {
    case invalidUsername
    case unableToComplete
    case invalidResponse
    case invalidData
    case generic
}

extension GHError {
    var alertItem : AlertItem{
        switch self {
        case .invalidData:
            return AlertContext.invalidData
        case .invalidUsername:
            return AlertContext.invalidUser
        case .unableToComplete:
            return AlertContext.unableToComplete
        case .invalidResponse:
            return AlertContext.invalidResponse
        case .generic:
            return AlertContext.generic
        }
    }
}
