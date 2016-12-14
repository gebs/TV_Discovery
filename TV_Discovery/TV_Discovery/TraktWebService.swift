//
//  CalendarWebService.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import SwiftyJSON
class TraktWebService{
    
    static func GetTodayShows(date:Date,access_token:String,onCompletion: @escaping ([Show])->Void) {
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "yyyy-MM-dd"
        
        
      let request =  WebService.CreateTraktRequest(url: "/calendars/all/shows/"+mydateformatter.string(from: date)+"/1?extended=full", access_token: "" )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if  let data = data {
                if let jsonObjectArray  = JSON(data:data).array{
                var shows = [Show]()
                for jsonobj in jsonObjectArray{
                    shows.append(Show(data:jsonobj))
                }
                    onCompletion(shows)
                }
                
            } else {
                
            }
        }
        task.resume()
        
      
    }
    
    static func GetShowsByDate(date:Date,access_token:String,onCompletion: @escaping ([Show])->Void) {
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "yyyy-MM-dd"
        
        let request =  WebService.CreateTraktRequest(url: "/calendars/all/shows/"+mydateformatter.string(from: date)+"/1?extended=full", access_token: "" )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if  let data = data {
                if let jsonObjectArray  = JSON(data:data).array{
                    var shows = [Show]()
                    for jsonobj in jsonObjectArray{
                        shows.append(Show(data:jsonobj))
                        
                    }
                    onCompletion(shows)
                }
                
            } else {
                
            }
        }
        task.resume()
    }
    static func GetSeasonsbyShow(id:Int,onCompletion: @escaping ([Season])->Void) {
        
        let request =  WebService.CreateTraktRequest(url: "shows/"+String(id)+"/seasons?extended=episodes", access_token: "" )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if  let data = data {
                if let jsonObjectArray  = JSON(data:data).array{
                    var seasons = [Season]()
                    for jsonobj in jsonObjectArray{
                        seasons.append(Season(data:jsonobj))
                        
                    }
                    onCompletion(seasons)
                }
                
            } else {
                
            }
        }
        task.resume()
    }
}
