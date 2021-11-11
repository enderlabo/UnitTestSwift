//
//  MockSignUpPresenter.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import Foundation
@testable import PicturesApp

class MockSignUpPresenter: SignUpPresenterProtocol {
    
    var processUserSignUpCalled: Bool = false
    required init(formModelValidator: SignUpModelValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
        //TODO:
    }
    
    func processUserSignUp(formModel: SignUpFormModel) {
        processUserSignUpCalled = true
    }
    
    
}
