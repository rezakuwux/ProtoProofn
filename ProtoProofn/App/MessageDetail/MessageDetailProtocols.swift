//
//  MessageDetailProtocols.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation

protocol MessageDetailViewProtocol: class {
    // PRESENTER -> VIEW
    func showMessageDetail(message: Message)
}

protocol MessageDetailPresenterProtocol: class {
    //View -> Presenter
    var view: MessageDetailViewProtocol? {get set}
    var router: MessageDetailRouterProtocol? {get set}
    
    func loadMessageDetail()
}
protocol MessageDetailRouterProtocol: class {
    //Presenter -> Router
    static func createMessageDetailModule(messageDetailRef: MessageDetailViewController, message: Message)
}
