//
//  ProtoConstant.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation

let API_LOGIN:String = "https://beta.proofn.com/v1/auth/login"
let API_INBOX:String = "https://beta.proofn.com/v1/messages/inbox"
let API_SEND_MESSAGE:String = "https://beta.proofn.com/v1/messages/send"

let TOKEN = "TOKEN"
let USER = "USER"

let USER_TOKEN:String = UserDefaults.standard.object(forKey: "TOKEN") as! String
let CURRENT_USER:[String:Any] = UserDefaults.standard.object(forKey: "USER") as! [String : Any]
