//
//  Inbox.swift
//  ViperDemo
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit
import SVProgressHUD

class InboxViewController: UIViewController,InboxViewProtocol {
    
    
    
    @IBOutlet var messageTblView: UITableView!
    
    var presenter:InboxPresenterProtocol?
    var messageList = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Inbox"
        InboxRouter.createInboxModule(inboxRef: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.loadInbox()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showMessages(with messages: [Message]) {
        messageList = messages
        messageTblView.reloadData()
    }
    
    func showErrorGetInbox(error: NSError) {
        SVProgressHUD.showError(withStatus: error.localizedDescription)
    }
}

extension InboxViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MessageTableViewCell = messageTblView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
        let message = messageList[indexPath.row]
        cell.setMessageCell(message: message)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMessageSelection(with: messageList[indexPath.row], from: self)
    }
    
}

