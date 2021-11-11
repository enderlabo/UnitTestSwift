//
//  TestingUITextFieldPropertiesTests.swift
//  PicturesAppUITests
//
//  Created by Elderson Jose Laborit Regardiz on 11/11/21.
//

import XCTest
@testable import PicturesApp

class TestingUITextFieldPropertiesTests: XCTestCase {
    
    var sut: SignupViewController!

    override func setUpWithError() throws {
        //Import and load the storyboard from app
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address UITextField isn't connected.")
        
                XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email address UITextField does not have an Email Address Content Type set")
    }

}
