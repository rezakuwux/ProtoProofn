//
//  LoginRouter.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    
    func presentInbox(from view: UIViewController) {
        let inboxViewController = view.storyboard?.instantiateViewController(withIdentifier: "InboxViewController") as! InboxViewController
        InboxRouter.createInboxModule(inboxRef: inboxViewController)
        
         let navigation = UINavigationController(rootViewController: inboxViewController)
        view.present(navigation, animated: true, completion: nil)
    }
    
    static func createLoginModule(loginRef: LoginViewController) {
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter()
        
        loginRef.presenter = presenter
        loginRef.presenter?.router = LoginRouter()
        loginRef.presenter?.view = loginRef
        loginRef.presenter?.interactor = LoginInteractor()
        loginRef.presenter?.interactor?.presenter = presenter
    }
    
}
