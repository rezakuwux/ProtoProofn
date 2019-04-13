//
//  InboxInteractor.swift
//  ViperDemo
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class InboxInteractor: InboxInputInteractorProtocol {
    
    weak var presenter: InboxOutputInteractorProtocol?
    
    func getInbox() {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer " + USER_TOKEN
        ]
        
        Alamofire.request(API_INBOX,  headers: headers).responseJSON { response in
            if let json = response.result.value as AnyObject? {
                if(response.response?.statusCode == 200){
                    let arrayResponse = json["data"] as! NSArray
                    let arrayObject = Mapper<Message>().mapArray(JSONArray: arrayResponse as! [[String : Any]]);
                    self.presenter?.inboxSuccessFetch(messageList: arrayObject)
                }else {
                    self.presenter?.inboxFailedFetch(error: NSError.init(domain: API_INBOX, code: response.response?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey : json["message"] as! String]))
                }
            }
            
            
        }
//        presenter?.inboxDidFetch(messageList: getAllMessage())
    }
    
}
