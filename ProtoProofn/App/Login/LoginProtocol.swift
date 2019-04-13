//
//  LoginProtocol.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//
import UIKit


protocol LoginViewProtocol: class {
    // PRESENTER -> VIEW
    func showLoginSucces()
    func showLoginFailure(error:NSError)
}

protocol LoginPresenterProtocol: class {
    //View -> Presenter
    var interactor: LoginInputInteractorProtocol? {get set}
    var view: LoginViewProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
    
    func doLogin(params:[String:Any])
    func goToLoginPage(from view:UIViewController )
}

protocol LoginInputInteractorProtocol: class {
    var presenter: LoginOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func loginRequest(params:[String:Any])
}

protocol LoginOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func loginDidSuccess()
    func loginDidFailure(error:NSError)
    
}

protocol LoginRouterProtocol: class {
    //Presenter -> Router
    func presentInbox(from view: UIViewController)
    static func createLoginModule(loginRef: LoginViewController)
}
