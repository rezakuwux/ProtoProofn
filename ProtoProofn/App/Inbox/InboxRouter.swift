//
//  InboxWireframe.swift
//  ViperDemo
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class InboxRouter: InboxRouterProtocol {
   
    func pushToMessageDetail(with message: Message,from view: UIViewController) {
        let messageDetailViewController = view.storyboard?.instantiateViewController(withIdentifier: "MessageDetailViewController") as! MessageDetailViewController
        MessageDetailRouter.createMessageDetailModule(messageDetailRef: messageDetailViewController, message:  message)
        view.navigationController?.pushViewController(messageDetailViewController, animated: true)
    }
    
    class func createInboxModule(inboxRef: InboxViewController) {
       let presenter: InboxPresenterProtocol & InboxOutputInteractorProtocol = InboxPresenter()
        
        inboxRef.presenter = presenter
        inboxRef.presenter?.router = InboxRouter()
        inboxRef.presenter?.view = inboxRef
        inboxRef.presenter?.interactor = InboxInteractor()
        inboxRef.presenter?.interactor?.presenter = presenter
    }
    
}
