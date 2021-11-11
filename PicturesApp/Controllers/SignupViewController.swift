//
//  SignupViewController.swift
//  PicturesApp
//
//  Created by Elderson Jose Laborit Regardiz on 10/11/21.
//

import UIKit


class SignupViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var signUpPresenter: SignUpPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if signUpPresenter == nil {
            let signUpModelValidator = SignUpFormModelValidator()
            let webService = SignUpWebService(urlString: SignUpConstrains.signUpURLString)
            
            signUpPresenter = SignUpPresenter(formModelValidator: signUpModelValidator, webService: webService, delegate: self)
        }
    }
    

    @IBAction func signUpButtonTapped(_ sender: Any) {
        let signUpFormModel = SignUpFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassowrd: repeatPasswordTextField.text ?? "")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.navigationController?.pushViewController(secondVC, animated: true)
        
        signUpPresenter?.processUserSignUp(formModel: signUpFormModel)
    }
    

}

extension SignupViewController: SignUpViewDelegateProtocol {
    func successFullSignUp() {
        //TODO:
    }
    
    func errorHandler(error: SignUpError) {
        //TODO:
    }
}
