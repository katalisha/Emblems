//
//  SendGrid.swift
//  Emblems
//
//  Created by Adam Corcoran on 18/06/2015.
//  Copyright (c) 2015 Australian Red Cross. All rights reserved.
//

import Foundation
import Alamofire

class SendGridTest {
    
    func sendToSendGrid() {        
        let parameters: [String: String] = ["api_user": "RedCrossApps", "api_key": "Powerofhumanity2015", "to": "adam_corcoran@me.com", "toname": "Australian Red Cross Emblem Misuse", "bcc": "apps@redcross.org.au", "bccname": "Australian Red Cross Apps", "subject": "Emblem Misuse Report from Emblems App", "text": "This is a test email.", "from": "apps@redcross.org.au"]
        
        Alamofire.request(.POST, "https://api.sendgrid.com/api/mail.send.json", parameters: parameters)
            .response { (request, response, data, error) in
                println(request)
                println(response)
                println(error)
        }
            .responseString { (_, _, string, _) in
                println(string)
            }
            .responseJSON { (_, _, JSON, _) in
                println(JSON)
        }
    }
    
}

// NEXT STEP: multi-part form data to add photo, and then add filename parameter