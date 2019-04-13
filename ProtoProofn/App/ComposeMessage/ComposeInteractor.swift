//
//  ComposeInteractor.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

class ComposeInteractor: ComposeInputInteractorProtocol {
    var presenter: ComposeOutputInteractorProtocol?
    
    func sendMessageRequest(params: [String : Any]) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer " + USER_TOKEN,
            ]
        Alamofire.request(API_SEND_MESSAGE, method: .post, parameters:params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            if let json = response.result.value as AnyObject? {
                if(response.response?.statusCode == 200 || response.response?.statusCode == 201){

                    if let message = Mapper<Message>().map(JSON: json as! [String : Any]){
                        self.presenter?.sendMessageSuccess(message: message)
                    }

                }else {
                    self.presenter?.sendMessageFailed(error: NSError.init(domain: API_SEND_MESSAGE, code: response.response?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey : json["message"] as! String]))
                }
            }


        }
    }
    
    func getContactList() {
        var contactList: NSArray?
        if let path = Bundle.main.path(forResource: "contact", ofType: "plist") {
            contactList = NSArray(contentsOfFile: path)
            presenter?.contactListDidFetch(contacs: contactList!)
        }
    }
}
