//
//  SignUpWebServiceProtocol.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import Foundation

protocol SignUpWebServiceProtocol {
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler:@escaping(SignUpResponseModel?, SignUpError?) -> Void)
        
}
