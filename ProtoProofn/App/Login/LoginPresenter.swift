//
//  LoginPresenter.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {

    var interactor: LoginInputInteractorProtocol?
    var view: LoginViewProtocol?
    var router: LoginRouterProtocol?
    
    
    func doLogin(params: [String : Any]) {
        interactor?.loginRequest(params: params)
    }
    
    func goToLoginPage(from view:UIViewController ) {
        router?.presentInbox(from: view)
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func loginDidSuccess() {
        view?.showLoginSucces()
    }
    
    func loginDidFailure(error: NSError) {
        view?.showLoginFailure(error: error)
    }
    
    
}
