//
//  MessageDetailRouter.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation

class MessageDetailRouter: MessageDetailRouterProtocol {

    class func createMessageDetailModule(messageDetailRef: MessageDetailViewController, message: Message) {
        let presenter = MessageDetailPresenter()
        presenter.message = message
        messageDetailRef.presenter = presenter
        messageDetailRef.presenter?.view = messageDetailRef
        
        
    }
    
    
}
