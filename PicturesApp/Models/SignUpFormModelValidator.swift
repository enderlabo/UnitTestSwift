//
//  SignUpFormModelValidator.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 5/11/21.
//

import Foundation


class SignUpFormModelValidator: SignUpModelValidatorProtocol {
  
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.isEmpty {
            returnValue = false
        }
        return returnValue
    }
    
    func isCountedFirstName(firstName: String) -> Bool {
        
        var returnValue = true
        
        if firstName.count < SignUpConstrains.firstNameMinLength || firstName.count > SignUpConstrains.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        
        var returnValue = true
        
        if lastName.count < SignUpConstrains.firstNameMinLength || lastName.count > SignUpConstrains.firstNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        
        var returnValue = true
            
            do {
                let regex = try NSRegularExpression(pattern: SignUpConstrains.emailRegEx)
                let nsString = email as NSString
                let results = regex.matches(in: email, range: NSRange(location: 0, length: nsString.length))
                
                if results.count == 0
                {
                    returnValue = false
                }
                
            } catch let error as NSError {
                print("invalid regex: \(error.localizedDescription)")
                returnValue = false
            }
            
            return  returnValue
    }
    
    func isPasswordValid(password: String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", SignUpConstrains.passwordRegEx)
        
        return passwordTest.evaluate(with: password)
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
       return password == repeatPassword
    }
}
