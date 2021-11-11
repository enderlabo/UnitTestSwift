//
//  MockSignUpViewDelegate.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import Foundation
import XCTest
@testable import PicturesApp

class MockSignUpViewDelegate: SignUpViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successFulSignUpCounter = 0
    var errorHandlerCounter = 0
    var signUpError: SignUpError?
    
    
    // MARK: - The count how many times this successFullSignUp is Called
    func successFullSignUp() {
        successFulSignUpCounter += 1
        expectation?.fulfill()
    }
    // MARK: - The count how many times this errorHandler is Called
    func errorHandler(error: SignUpError) {
        signUpError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
        
    }
    
    
    
    
}
