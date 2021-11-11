//
//  SignUpPresenterProtocol.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import Foundation

protocol SignUpPresenterProtocol: AnyObject {
    
    //Init properties/ Constructor
    init(formModelValidator: SignUpModelValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol)
    func processUserSignUp(formModel: SignUpFormModel)
}
