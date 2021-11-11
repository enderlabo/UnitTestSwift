//
//  MockSignUpWebService.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 9/11/21.
//

import Foundation
@testable import PicturesApp

class MockSignUpWebService: SignUpWebServiceProtocol {
    var isSignUpMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        
        isSignUpMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignUpError.failedRequest(description: "SignUp request was not successful"))
        } else {
            let responseModel = SignUpResponseModel(status: "Ok")
            completionHandler(responseModel, nil)
        }
    }
}
