//
//  SignUpConstraints.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 5/11/21.
//

import Foundation

struct SignUpConstrains {
    
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    static let passwordRegEx = "(?=[^a-z]*[a-z])(?=[^0-9]*[0-9])[a-zA-Z0-9!@#$%^&*]{8,}"
    static let signUpURLString = "https://jsonplaceholder.typicode.com/posts/1"
    static let ErrorDescription = "A Localized description of an error"
}
