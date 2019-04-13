//
//  ComposeViewController.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit
import KMPlaceholderTextView
import SearchTextField
import SVProgressHUD

class ComposeViewController: UIViewController {
    
    var presenter: ComposePresenterProtocol?
    @IBOutlet var recipient:SearchTextField!
    @IBOutlet var subjectField:UITextField!
    @IBOutlet var contentTextView:KMPlaceholderTextView!
    
    var contacts = NSArray()
    var selectedContact:[String:Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        ComposeRouter.createComposeModule(composeRef: self)
        presenter?.loadContactList()
        recipient.theme.font = UIFont.systemFont(ofSize: 12)
        recipient.itemSelectionHandler = { filteredResults, itemPosition in
            self.recipient.text = filteredResults[itemPosition].title
            self.selectedContact = self.contacts[itemPosition] as? [String : Any]
        }
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        contentTextView.contentInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: -4)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSend(_ sender:UIButton){
        SVProgressHUD.show()
        presenter?.sendMessage(params: ["subject":subjectField.text!,"content":contentTextView.text!,"to":[self.selectedContact]])
    }
}

extension ComposeViewController:ComposeViewProtocol{
    func addContactList(contactList: NSArray) {
        contacts = contactList
        let nameArray = contactList.value(forKey: "fullName")
        recipient.filterStrings(nameArray as! [String])
    }
    func showSuccessThenPop() {
        SVProgressHUD.showSuccess(withStatus: "Message Send")
        self.navigationController?.popViewController(animated: true)
    }
    
    func showErrorSend(error: NSError) {
        SVProgressHUD.showError(withStatus: error.localizedDescription)
    }
}
