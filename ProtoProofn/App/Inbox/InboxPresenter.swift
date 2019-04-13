//
//  InboxPresenter.swift
//  ViperDemo
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class InboxPresenter: InboxPresenterProtocol {
    var router: InboxRouterProtocol?
    var view: InboxViewProtocol?
    var interactor: InboxInputInteractorProtocol?
    var presenter: InboxPresenterProtocol?
    
    func showMessageSelection(with message: Message, from view: UIViewController) {
        router?.pushToMessageDetail(with: message, from: view)
    }
    
    func loadInbox() {
        interactor?.getInbox()
    }
    
}

extension InboxPresenter: InboxOutputInteractorProtocol {
    func inboxSuccessFetch(messageList: [Message]) {
        view?.showMessages(with: messageList)
    }
    
    func inboxFailedFetch(error: NSError) {
        view?.showErrorGetInbox(error: error)
    }
    
    
}
