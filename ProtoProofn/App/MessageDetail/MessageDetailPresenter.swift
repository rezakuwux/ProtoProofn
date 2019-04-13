//
//  MessageDetailPresenter.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation


class MessageDetailPresenter: MessageDetailPresenterProtocol {
    var router: MessageDetailRouterProtocol?
    
    
    var view: MessageDetailViewProtocol?
    var message:Message?
    
    func loadMessageDetail() {
        view?.showMessageDetail(message: message!)
    }
}

