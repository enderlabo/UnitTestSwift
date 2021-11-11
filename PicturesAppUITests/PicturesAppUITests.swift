//
//  PicturesAppUITests.swift
//  PicturesAppUITests
//
//  Created by Elderson Jose Laborit Regardiz on 5/11/21.
//

import XCTest
@testable import PicturesApp

class PicturesAppUITests: XCTestCase {

    var sut: SignupViewController!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        //Import and load the storyboard from app
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Instantiate UIVIewController With StoryBoard ID
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        // Make the viewDidLoad() execute.
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        //Dispatch resources.
        sut = nil
        navigationController = nil
    }
    
    // MARK: - Testing TextField from Storyboard.
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField isn't connected.")
        
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email address UITextField does not have an Email Address Content Type set")
    }
    
    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField is not connected")
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress,  "Email address UITextField does not have an Email keyboard Type set")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureTextEntryField() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "PasswordTextField isn't connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password UITextField isn't a Secure Text Entry")
    }
    
    // MARK: - Description: Testing ViewControllerNavigation
    func testNextViewButton_WhenTapped_SecondViewControllerIsPushed(){
        
        let myPredicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is SecondViewController
        }
        
        expectation(for: myPredicate, evaluatedWith: navigationController)
        
        sut.signUpButton.sendActions(for: .touchUpInside)
        
        waitForExpectations(timeout: 1.5)
    }
    
}
