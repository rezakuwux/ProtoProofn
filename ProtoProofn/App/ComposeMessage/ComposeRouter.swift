//
//  ComposeRouter.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class  ComposeRouter: ComposeRouterProtocol {
    static func createComposeModule(composeRef: ComposeViewController) {
        let presenter: ComposePresenterProtocol & ComposeOutputInteractorProtocol = ComposePresenter()
        
        composeRef.presenter = presenter
        composeRef.presenter?.router = ComposeRouter()
        composeRef.presenter?.view = composeRef
        composeRef.presenter?.interactor = ComposeInteractor()
        composeRef.presenter?.interactor?.presenter = presenter
    }
    
}

