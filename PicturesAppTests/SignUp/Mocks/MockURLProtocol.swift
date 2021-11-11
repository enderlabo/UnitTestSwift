//
//  MockURLProtocol.swift
//  PicturesAppTests
//
//  Created by Elderson Jose Laborit Regardiz on 8/11/21.
//

import Foundation
import Alamofire

class MockURLProtocol: URLProtocol {
    
    // MARK: Injection Dependency
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    // MARK: - The canonnical form of request
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    // MARK: - Instead of loading a real request.
    override func startLoading() {
        
        if let signUpError = MockURLProtocol.error{
            self.client?.urlProtocol(self, didFailWithError: signUpError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    // MARK: -
    override func stopLoading() {}
}
