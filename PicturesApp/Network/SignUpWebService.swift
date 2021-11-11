//
//  SignUpWebService.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 8/11/21.
//

import Foundation

class SignUpWebService: SignUpWebServiceProtocol {
   
    
    //Injection URL
    private var urlSession: URLSession
    private var urlString: String
    private var shouldReturnError: Bool
    
    init(urlString: String, urlSession: URLSession = .shared, shouldReturnError: Bool = false){
        self.urlString = urlString
        //Init Depencency
        self.urlSession = urlSession
        self.shouldReturnError = shouldReturnError
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignUpResponseModel?, SignUpError?) -> Void) {
        
    }
    
    func signUp(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SignUpResponseModel?, SignUpError?) -> Void) {
        
       guard let url = URL(string: urlString) else {
           completionHandler(nil, SignUpError.invalidRequestURLString)
           return
       }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        //Inject dependency URLSession.shared to urlSession
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            
            if let requestError = error {
                completionHandler(nil, SignUpError.failedRequest(description: requestError.localizedDescription))
                return 
            }
            
            if let data = data, let signUpResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                 completionHandler(signUpResponseModel, nil)
            } else {
                
                completionHandler(nil, SignUpError.invalidResponseModel)
            }
        }
        dataTask.resume()
        
    }
}
