//
//  WebService.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
class WebService{
    static func CreateTraktRequest (url: String,access_token:String) -> URLRequest{
        let requestURL = URL(string:"https://api.trakt.tv"+url)!
        
        var request = URLRequest(url:requestURL)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer "+access_token+"", forHTTPHeaderField: "Authorization")
        request.addValue("2", forHTTPHeaderField: "trakt-api-version")
        request.addValue("c7abc6c338f78f1053a4a8d20ab0ba675c039b2cba8f309d3f2baa750fcf3744", forHTTPHeaderField: "trakt-api-key")
        
        return request
    }
}
