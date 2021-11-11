//
//  SignupForRequestModel.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 8/11/21.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    
    let userId: String
    let id: String
    let title: String
    let body: String
}
