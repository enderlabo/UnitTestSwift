//
//  SignUpErrors.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 8/11/21.
//

import Foundation

enum SignUpError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
    
}
