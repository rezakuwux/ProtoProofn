//
//  MessageTableViewCell.swift
//  ProtoProofn
//
//  Created by Reza on 13/04/19.
//  Copyright © 2019 Kuwux. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var initialLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var subjectLabel: UILabel!
    @IBOutlet var contentPreviewLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMessageCell(message:Message) {
        initialLabel.backgroundColor = UIColor.generateRandomPastelColor()
        initialLabel.text = message.sender.fullName.substring(toIndex: 1)
        nameLabel.text = message.sender.fullName
        subjectLabel.text = message.subject
        contentPreviewLabel.text = message.contentPreview
        timeLabel.text = message.updatedAt.stringDate(fromFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'", toFormat: "d MMM yyyy\nHH:mm")
    }

}
