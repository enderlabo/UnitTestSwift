//
//  SignUpViewDelegateProtocol.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import Foundation

protocol SignUpViewDelegateProtocol: AnyObject {
    
    func successFullSignUp()
    func errorHandler(error: SignUpError)
}
