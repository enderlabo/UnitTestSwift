//
//  MockSignUpModelValidator.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 9/11/21.
//

import Foundation
@testable import PicturesApp

class MockSignUpModelValidator: SignUpModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated : Bool = false
    var isEmailValidated    : Bool = false
    var isPasswordValidated : Bool = false
    var isPasswordEqualityValidated : Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return isPasswordEqualityValidated
    }
    
  
}
