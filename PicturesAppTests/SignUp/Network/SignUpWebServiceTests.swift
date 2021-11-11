//
//  SignUpWebServiceTests.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 8/11/21.
//

import XCTest
@testable import PicturesApp

class SignUpWebServiceTests: XCTestCase {
    
    var sut: SignUpWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        let urlSession = URLSession(configuration: config)
        sut = SignUpWebService(urlString: SignUpConstrains.signUpURLString, urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(userId: "1", id: "1", title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto")
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignUpWebService_WhenGivenSuccessFullREsponse_ReturnsSuccess(){
        // Arrange
        let jsonString = "{\"status\":\"OK\" }"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "SignUp Web Service Response Expectation")
        // Activity
        sut.signUp(withForm: signupFormRequestModel){ (signUpResponseModel, error) in
            // Assert
            //"{\"status\":\"ok\"}" tested on own api rest
            XCTAssertEqual(signUpResponseModel?.status, "OK")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSIgnUpWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        let jsonString = "{}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "SignUp() method expectation for a response that contains a different JSON structure")
        // Activity
        sut.signUp(withForm: signupFormRequestModel){ (signUpResponseModel, error) in
            // Assert
            //"{\"status\":\"ok\"}" tested on own api rest
            XCTAssertNil(signUpResponseModel, "The response model for a request containing unknow JSON response, should have been nil")
            XCTAssertEqual(error, SignUpError.invalidResponseModel, "The SignUp() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignUpWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation.")
        
        sut = SignUpWebService(urlString: "")
        
        // Act
        sut.signUp(withForm: signupFormRequestModel) { SignUpResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignUpError.invalidRequestURLString, "The signUp() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(SignUpResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
            
           
            self.wait(for: [expectation], timeout: 2)
        }
        
    }
}
