//
//  MessageDetailViewController.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class MessageDetailViewController: UIViewController, MessageDetailViewProtocol {
    
    @IBOutlet var fromUserLabel: UILabel!
    @IBOutlet var fromEmailLabel: UILabel!
    @IBOutlet var toUserLabel: UILabel!
    @IBOutlet var toEmailLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    var presenter: MessageDetailPresenterProtocol?
    var contacts = NSArray()
    var selectedContact:[String:Any]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadMessageDetail()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showMessageDetail(message: Message) {
        fromUserLabel.text = message.sender.fullName
        fromEmailLabel.text = message.sender.email
        toUserLabel.text = message.to[0].fullName
        toEmailLabel.text = message.to[0].email
        subjectLabel.text = message.subject
        dateLabel.text = message.updatedAt.stringDate(fromFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'", toFormat: "EEEE, d MMM yyyy")
        timeLabel.text = message.updatedAt.stringDate(fromFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'", toFormat: "HH:mm")
        contentLabel.text = message.content != "" ? message.content:message.contentPreview
        
        
    }
    
}
