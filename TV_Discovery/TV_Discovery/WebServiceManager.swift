//
//  WebServiceManager.swift
//  TV_Discovery
//
//  Created by iOSKurs on 01.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
class WebServiceManager{
    private static var instance: WebServiceManager?
    public static var Instance: WebServiceManager{
        get{
            if let inst = instance{
                return inst
            }else{
                instance = WebServiceManager()
                return instance!
            }
        }
    }
    
    
    
    private init(){
        TVDBWebService.Login(onLoginCompletion: {(data) in print(data)})
    }
    
    public func GetCurrentShows(onCompletion: @escaping ([Show])-> Void){
        TraktWebService.GetTodayShows(date: Date(), access_token: "", onCompletion: onCompletion)
    }
    public func GetShowsByDate(date: Date, onCompletion: @escaping ([Show])-> Void){
        TraktWebService.GetShowsByDate(date : date, access_token: "", onCompletion: onCompletion)
    }
    public func GetSeasonsByShow(id: Int, onCompletion: @escaping ([Season])->Void){
        TraktWebService.GetSeasonsbyShow(id: id, onCompletion: onCompletion)
    }

    
    public func GetShowImages(id:String,onCompletion:@escaping(String)-> Void){
        TVDBWebService.GetImages(id: id, onCompletion: onCompletion)
    }
    
}
