//
//  PicturesAppTests.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 5/11/21.
//

import XCTest
@testable import PicturesApp

//Mark: - Each func need  should be test positive and negative scenario.

class PicturesAppTests: XCTestCase {
    // Arrange
    var sut: SignUpFormModelValidator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        
        
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Elderson")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have a returned TRUE for a valid first name but returned FALSE.")
        
    }
    
    func testSignFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
         // Act
        let isTooLongName = sut.isCountedFirstName(firstName: "EldersonJosé")
        
        //Assert
        XCTAssertFalse(isTooLongName, "The isCountedFirstName() should have a returned FALSE for a firstName that is a long that \(SignUpConstrains.firstNameMaxLength) and short that \(SignUpConstrains.firstNameMinLength)")
    }
    
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnFalse(){
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Laborit")
        // Assert
        XCTAssertTrue(isLastNameValid, "The isCountedLastName() should have a returned FALSE for a lastName that is a short that \(SignUpConstrains.firstNameMinLength) and long that \(SignUpConstrains.firstNameMaxLength)")
    }
    
    func testSignFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue(){
        // Act
        let isEmailValid = sut.isValidEmailFormat(email: "enderlabo@gmail.com")
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have a returned TRUE for a valid email but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue(){
        // Act
        let isPasswordsMatch = sut.doPasswordsMatch(password: "123456789", repeatPassword: "123456789")
        // Assert
        XCTAssertTrue(isPasswordsMatch, "The doPasswordsMatch() should have a returned TRUE for a matches password but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse(){
        // Act
        let isPasswordsMatch = sut.doPasswordsMatch(password: "123456789", repeatPassword: "123456788")
        // Assert
        XCTAssertFalse(isPasswordsMatch, "The doPasswordsMatch() Should have a returned FALSE for a unMatching password but returned TRUE")
    }

}
