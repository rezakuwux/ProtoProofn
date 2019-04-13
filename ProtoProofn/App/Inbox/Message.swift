import ObjectMapper


class Message: Mappable {
    var id : String!
    var contentType : String!
    var box : String!
    var labels : [AnyObject]!
    var threadID : String!
    var inReplyTo : String!
    var forwardFrom : String!
    var type : Int!
    var ownerID : String!
    var ownerEmail : String!
    var asPart : Int!
    var to : [To]!
    var cc : [AnyObject]!
    var bcc : [AnyObject]!
    var sender : Sender!
    var subject : String!
    var subjectPreview : String!
    var content : String!
    var contentPreview : String!
    var attachmentCount : Int!
    var deliveryStatus : Int!
    var createdAt : String!
    var sentAt : String!
    var receivedAt : String!
    var firstReadAt : String!
    var lastReadAt : String!
    var updatedAt : String!
    var editedAt : String!
    var meta : AnyObject!
    var readerList : [AnyObject]!
    var participantHash : String!
    var attachments : [AnyObject]!
    var isGroup : Bool!
    var isRead : Bool!
    var reportCount : Int!
    var externalID : String!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        contentType <- map["contentType"]
        box <- map["box"]
        threadID <- map["threadID"]
        inReplyTo <- map["inReplyTo"]
        forwardFrom <- map["forwardFrom"]
        type <- map["type"]
        ownerID <- map["ownerID"]
        ownerEmail <- map["ownerEmail"]
        asPart <- map["asPart"]
        subject <- map["subject"]
        subjectPreview <- map["subjectPreview"]
        content <- map["content"]
        contentPreview <- map["contentPreview"]
        attachmentCount <- map["attachmentCount"]
        deliveryStatus <- map["deliveryStatus"]
        createdAt <- map["createdAt"]
        sentAt <- map["sentAt"]
        receivedAt <- map["receivedAt"]
        firstReadAt <- map["firstReadAt"]
        lastReadAt <- map["lastReadAt"]
        updatedAt <- map["updatedAt"]
        editedAt <- map["editedAt"]
        participantHash <- map["participantHash"]
        isGroup <- map["isGroup"]
        isRead <- map["isRead"]
        reportCount <- map["reportCount"]
        externalID <- map["externalID"]
        sender <- map["sender"]
        meta <- map["meta"]
        to <- map["to"]
    }
    
//    func getInterlocutorName() -> String{
//        if self.sender.id == CURRENT_USER["id"] as? String{
//            
//        }
//        return self.sender.fullName
//    }
}

class Sender : Mappable{
    
    var id : String!
    var hash : String!
    var email : String!
    var firstName : String!
    var lastName : String!
    var fullName : String!
    var avatarPathSmall : String!
    var avatarPathMedium : String!
    var avatarPathLarge : String!
    var slug : String!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        hash <- map["hash"]
        email <- map["email"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        fullName <- map["fullName"]
        avatarPathSmall <- map["avatarPathSmall"]
        avatarPathMedium <- map["avatarPathMedium"]
        avatarPathLarge <- map["avatarPathLarge"]
        slug <- map["slug"]
    }
}


class To : Mappable{
    
    var id : String!
    var hash : String!
    var fullName : String!
    var email : String!
    var phoneNumber : String!
    var avatarPathSmall : String!
    var avatarPathMedium : String!
    var avatarPathLarge : String!

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        hash <- map["hash"]
        fullName <- map["fullName"]
        email <- map["email"]
        phoneNumber <- map["phoneNumber"]
        avatarPathSmall <- map["avatarPathSmall"]
        avatarPathMedium <- map["avatarPathMedium"]
        avatarPathLarge <- map["avatarPathLarge"]
    }
}
