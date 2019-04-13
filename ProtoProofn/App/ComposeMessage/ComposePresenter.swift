//
//  ComposePresenter.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class ComposePresenter: ComposePresenterProtocol {
    
    var interactor: ComposeInputInteractorProtocol?
    
    var view: ComposeViewProtocol?
    
    var router: ComposeRouterProtocol?
    
    func sendMessage(params: [String : Any]) {
        interactor?.sendMessageRequest(params: params)
    }
    func loadContactList() {
        interactor?.getContactList()
    }
    
}

extension ComposePresenter: ComposeOutputInteractorProtocol {
    func contactListDidFetch(contacs: NSArray) {
        view?.addContactList(contactList: contacs)
    }
    
    func sendMessageSuccess(message: Message) {
        view?.showSuccessThenPop()
    }
    
    func sendMessageFailed(error: NSError) {
        view?.showErrorSend(error: error)
    }
    

    
}
