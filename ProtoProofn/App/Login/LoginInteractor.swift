//
//  LoginInteractor.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import Foundation
import Alamofire

class LoginInteractor: LoginInputInteractorProtocol {
    weak var presenter: LoginOutputInteractorProtocol?
    
    func loginRequest(params: [String : Any]) {
        if (params["identifier"] == nil){
            presenter?.loginDidFailure(error: NSError.init(domain: "no domain", code: 999, userInfo: [NSLocalizedDescriptionKey : "Username can't be empty"]))
            return;
        }
        else if (params["password"] == nil){
            presenter?.loginDidFailure(error: NSError.init(domain: "no domain", code: 999, userInfo: [NSLocalizedDescriptionKey : "Password can't be empty"]))
            return;
        }
        Alamofire.request(API_LOGIN, method: .post, parameters:params, encoding: JSONEncoding.default).responseJSON { response in
            if let json = response.result.value as AnyObject? {
                if(response.response?.statusCode == 200){
                    self.presenter?.loginDidSuccess()
                    UserDefaults.standard.set(json["token"] as Any?, forKey: TOKEN)
                    UserDefaults.standard.set(json["user"] as Any?, forKey: USER)
                }else {
                    self.presenter?.loginDidFailure(error: NSError.init(domain: API_LOGIN, code: response.response?.statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey : json["message"] as! String]))
                }
            }
            

        }
    }
}
