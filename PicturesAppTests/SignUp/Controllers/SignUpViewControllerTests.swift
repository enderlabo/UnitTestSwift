//
//  SignUpViewControllerTests.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import XCTest
@testable import PicturesApp

class SignUpViewControllerTests: XCTestCase {
    
    var storyBoard: UIStoryboard!
    var sut: SignupViewController!
    var mockSignUpModelValidator: MockSignUpModelValidator!
    var mockSignUpWebService: MockSignUpWebService!
    var mockSignUpViewDelegate: MockSignUpViewDelegate!

    override func setUpWithError() throws {
        
        // MARK: - Load StoryBoard
         storyBoard = UIStoryboard(name: "Main", bundle: nil)
         sut = storyBoard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        
        sut?.loadViewIfNeeded()
        
         mockSignUpModelValidator = MockSignUpModelValidator()
         mockSignUpWebService = MockSignUpWebService()
         mockSignUpViewDelegate = MockSignUpViewDelegate()
        
    }

    override func tearDownWithError() throws {
        storyBoard = nil
        sut = nil
    }
    
    // MARK: - Testing Form from UIViewController
    func testSignUpViewController_WhenCreated_HasRequiredTextFieldEmpty() throws{
  
        // XCTUnwrap(sut.firstNameText) is used when some reference throws nil or don`t have connection to an IBOutlet
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstName is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastName textField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPassword = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPassword textfield is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Lastname text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPassword.text, "", "Repeat Password text field was not empty when the view controller initially loaded")
    }
    
    
    // MARK: - Testing SignUp Button Action, always need to reference to outlet and action button
    func testViewController_WhenCreated_HasSignUpButtonAndAction() throws {
        //Arrange
        let signUpButton: UIButton = try XCTUnwrap(sut.signUpButton, "SignUp button does not have a referencing outlet")
        // Act
        let signUbButtonActions = try XCTUnwrap(signUpButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        // Assert
        XCTAssertEqual(signUbButtonActions.count, 1)
        
        XCTAssertEqual(signUbButtonActions.first, "signUpButtonTapped:", "There is no action with a name signUpButtonTapped assigned to signUp button")
    }
    
    func testViewController_WhenSignUpButtonTapped_InvokesSignUpProcess(){
        // Arrange
        
        let mockSignUpPresenter = MockSignUpPresenter(formModelValidator: mockSignUpModelValidator, webService: mockSignUpWebService, delegate: mockSignUpViewDelegate)
        // Act
        sut.signUpPresenter = mockSignUpPresenter
        sut.signUpButton.sendActions(for: .touchUpInside)
        
        // Assert
//        XCTAssertTrue(mockSignUpPresenter.processUserSignUpCalled, "The processUserSignUp() method was not called on a Presenter object when the signUp button was tapped in a SignUpViewController")
    }

}
