//
//  LoginViewController.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var presenter:LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.text = "mattest3@beta.proofn.com"
        passwordField.text = "qwe123123"
        LoginRouter.createLoginModule(loginRef: self)
//        presenter?.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didTapLogin (_ sender:UIButton){
        SVProgressHUD.show()
        presenter?.doLogin(params: ["identifier":usernameField.text!,"password":passwordField.text!])
    }
    
    
}

extension LoginViewController:LoginViewProtocol{
    func showLoginSucces() {
        SVProgressHUD.dismiss()
        presenter?.goToLoginPage(from: self)
    }
    
    func showLoginFailure(error: NSError) {
        SVProgressHUD.showError(withStatus: error.localizedDescription)
    }
}
