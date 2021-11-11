//
//  SignUpPresenter.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 9/11/21.
//

import Foundation

class SignUpPresenter: SignUpPresenterProtocol {
    
    private var formModelValidator: SignUpModelValidatorProtocol
    private var webService: SignUpWebServiceProtocol
    private weak var delegate: SignUpViewDelegateProtocol?
    
    //Init properties/ Constructor
   required init(formModelValidator: SignUpModelValidatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
        
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    // MARK: - Description: Evaluate values from formApp
    func processUserSignUp(formModel: SignUpFormModel){
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassowrd) {
            return
        }
        
        let requestModel = SignupFormRequestModel(userId: formModel.firstName, id: formModel.lastName, title: formModel.email, body: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self] (responnseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responnseModel {
                self?.delegate?.successFullSignUp()
                return
            }
        }
    }
}
