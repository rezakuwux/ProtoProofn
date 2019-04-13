//
//  InboxProtocols.swift
//  ViperDemo
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit


protocol InboxViewProtocol: class {
    // PRESENTER -> VIEW
    func showMessages(with messages: [Message])
    func showErrorGetInbox(error:NSError)
}

protocol InboxPresenterProtocol: class {
    //View -> Presenter
    var interactor: InboxInputInteractorProtocol? {get set}
    var view: InboxViewProtocol? {get set}
    var router: InboxRouterProtocol? {get set}

    func loadInbox()
    func showMessageSelection(with message: Message, from view: UIViewController)
}

protocol InboxInputInteractorProtocol: class {
    var presenter: InboxOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func getInbox()
}

protocol InboxOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func inboxSuccessFetch(messageList: [Message])
    func inboxFailedFetch(error: NSError)
}

protocol InboxRouterProtocol: class {
    //Presenter -> Wireframe
    func pushToMessageDetail(with message: Message,from view: UIViewController)
    static func createInboxModule(inboxRef: InboxViewController)
}
