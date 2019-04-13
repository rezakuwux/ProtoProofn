//
//  ComposeProtocols.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation

protocol ComposeViewProtocol: class {
    // PRESENTER -> VIEW
    func showSuccessThenPop()
    func showErrorSend(error:NSError)
    func addContactList(contactList:NSArray)
}

protocol ComposePresenterProtocol: class {
    //View -> Presenter
    var interactor: ComposeInputInteractorProtocol? {get set}
    var view: ComposeViewProtocol? {get set}
    var router: ComposeRouterProtocol? {get set}
    
    func sendMessage(params:[String:Any])
    func loadContactList()
}

protocol ComposeInputInteractorProtocol: class {
    var presenter: ComposeOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func sendMessageRequest(params:[String:Any])
    func getContactList()
}

protocol ComposeOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func sendMessageSuccess(message: Message)
    func sendMessageFailed(error: NSError)
    func contactListDidFetch(contacs:NSArray)
}

protocol ComposeRouterProtocol: class {
    //Presenter -> Router
    static func createComposeModule(composeRef: ComposeViewController)
}
