//
//  SignUpPresenterTests.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 9/11/21.
//

import XCTest
@testable import PicturesApp

class SignUpPresenterTests: XCTestCase {
    
    // Arrange
    var signUpFormModel: SignUpFormModel!
    var sut: SignUpPresenter!
    var mockSignUpViewDelegate: MockSignUpViewDelegate!
    
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Arrange
        signUpFormModel = SignUpFormModel(firstName: "Elderson",
                                              lastName: "Laborit",
                                              email: "test@gmail.com",
                                              password: "102030",
                                              repeatPassowrd: "102030")
        mockSignUpViewDelegate = MockSignUpViewDelegate()
         
        // Act
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignUpPersenter_WhenInformationProvided_WillValidateEachProperty() {

        let mockSignUpModelValidator = MockSignUpModelValidator()
        let mockSignUpWebService = MockSignUpWebService()
        
        let sut = SignUpPresenter(formModelValidator: mockSignUpModelValidator, webService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
        
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        
        // Assert
        
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordEqualityValidated, "Did not validate if passwords match")
    }

    func testSignUpPresenter_WhenGivenValidFormModel_ShouldCallSignUpMethod(){
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let mockSignUpWebService = MockSignUpWebService()
        // Act
        let sut = SignUpPresenter(formModelValidator: mockSignUpModelValidator, webService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
        
        sut.processUserSignUp(formModel: signUpFormModel)
        // Assert
        XCTAssertTrue(mockSignUpWebService.isSignUpMethodCalled, "The SignUpMethod was not called in the SignUpWebService Class")
    }
    
    func testSignUpPresenter_WhenSignUpOperationSuccessful_CallSuccessOnViewDelegate(){
        // Arrange
        let myExpectation = expectation(description: "Expected the successFulSignUp() method to be called")
        // Act
        mockSignUpViewDelegate.expectation = myExpectation
        
        sut.processUserSignUp(formModel: signUpFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
    }
    
    func testSignUpPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate(){
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockSignUpViewDelegate.expectation = errorHandlerExpectation
        //MockSignUpWebService.shouldReturnError = true
        
        // Act
        sut.processUserSignUp(formModel: signUpFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignUpViewDelegate.successFulSignUpCounter, 0)
        XCTAssertEqual(mockSignUpViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignUpViewDelegate.signUpError)
        
    }
    
    
}
