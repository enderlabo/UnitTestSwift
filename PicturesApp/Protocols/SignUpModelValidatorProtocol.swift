//
//  SignUpModelValidatorProtocol.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 9/11/21.
//

import Foundation

protocol SignUpModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isValidEmailFormat(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
    
    
}
