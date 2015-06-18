//
//  SendGrid.swift
//  Emblems
//
//  Created by Adam Corcoran on 18/06/2015.
//  Copyright (c) 2015 Australian Red Cross. All rights reserved.
//

import Foundation
class SendGridTest {
    
    func sendToSendGrid() {
//        let apiUser = "RedCrossApps"
//        let apiKey = "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"
//        let toEmail = "emblemmisuse@redcross.org.au"
//        let toName = "Australian Red Cross Emblem Misuse"
//        let bccEmail = "apps@redcross.org.au"
//        let bccName = "Australian Red Cross Apps"
//        let subject = "Emblem Misuse Report from Emblems App"
//        let text = "<injected from textField>"
//        let image = "<injected from imageView>"
//        let from = "emblemsapp@redcross.org.au"
        
        let sendGridDict: [String: String] = ["to": "emblemmisuse@redcross.org.au", "toname": "Australian Red Cross Emblem Misuse", "bcc": "apps@redcross.org.au", "bccname": "Australian Red Cross Apps", "subject": "Emblem Misuse Report from Emblems App", "text": "This is a test email.", "from": "apps@redcross.org.au"]
    }
    
}