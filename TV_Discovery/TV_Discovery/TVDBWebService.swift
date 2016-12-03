//
//  TVDBWebService.swift
//  TV_Discovery
//
//  Created by iOSKurs on 01.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import SwiftyJSON
class TVDBWebService{
    static var tvdbAccess:String! = ""
    static func Login(onLoginCompletion:@escaping (String)->Void){
        let request = WebService.CreateTVDBLoginRequest()
        
        let task = URLSession.shared.dataTask(with:request) {data,request,error in
            if let data = data{
                print(String(data:data,encoding:.utf8))
                var tokenjson = JSON(data:data)
                if let token = tokenjson["token"].string{
                    self.tvdbAccess = token
                    onLoginCompletion(token);
                }
            }
        
        }
        task.resume()
    }
    static func GetImages(id:String,onCompletion:@escaping (String)-> Void){
        if (self.tvdbAccess == ""){
            return
        }
        
        let request = WebService.CreateTVDBRequest(url: "/series/"+id, access_token: tvdbAccess)
        
        let task = URLSession.shared.dataTask(with: request){data,request,error in
            if let data = data {
                print(String(describing: data))
                var showjson = JSON(data:data)
                print(String(describing: showjson))
            }
        }
        task.resume()
    }
}
