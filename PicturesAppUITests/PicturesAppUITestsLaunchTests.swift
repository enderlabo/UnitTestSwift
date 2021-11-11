//
//  PicturesAppUITestsLaunchTests.swift
//  PicturesAppUITests
//
//  Created by Elderson Jose Laborit Regardiz on 5/11/21.
//

import XCTest

class PicturesAppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    // MARK: - Description: UITEST
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        // Testing each textField with Recording UITest
        let firstName = app.textFields["Name:"]
        let lastNamae = app.textFields["LastName:"]
        let email = app.textFields["Email:"]
        let password = app.secureTextFields["Password:"]
        let repeatPassword = app.secureTextFields["Repeat Password:"]
        let signupButton = app/*@START_MENU_TOKEN@*/.staticTexts["Sign Up"]/*[[".buttons[\"Sign Up\"].staticTexts[\"Sign Up\"]",".staticTexts[\"Sign Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
             
                
        XCTAssertTrue(firstName.isEnabled, "firstName UITextField isn't enabled for user interactions")
        XCTAssertTrue(lastNamae.isEnabled, "lastNamae UITextField isn't enabled for user interactions")
        XCTAssertTrue(email.isEnabled, "email UITextField isn't enabled for user interactions")
        XCTAssertTrue(password.isEnabled, "password UITextField isn't enabled for user interactions")
        XCTAssertTrue(repeatPassword.isEnabled, "repeatPassword UITextField isn't enabled for user interactions")
        XCTAssertTrue(signupButton.isEnabled, "signupButton isn't enabled for user interactions")


        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
