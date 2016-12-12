//
//  Show.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Show {
    
    public var title : String?
    public var year : Int?
    public var ids : Ids?
    public var episode : Episode?
    public var overview : String?
    public var first_aired : String?
    public var airs : Airs?
    public var runtime : Int?
    public var certification : String?
    public var network : String?
    public var country : String?
    public var updated_at : String?
    public var trailer : String?
    public var homepage : String?
    public var status : String?
    public var rating : Double?
    public var votes : Int?
    public var language : String?
    public var available_translations : Array<String>?
    public var genres : Array<String>?
    public var aired_episodes : Int?
    public var isFavorite : Bool = false
    
    init(){
        
    }
    
    init(data:JSON){
        if let title = data["show"]["title"].string{
            self.title = title
        }
        if let year = data["show"]["year"].int{
            self.year = year
        }
        
        self.ids = Ids(data:data["show"]["ids"])
        self.episode = Episode(data:data["episode"])
        self.airs = Airs(data:data["airs"])
  
        if let overview = data["show"]["overview"].string{
            self.overview = overview
        }
        if let first_aired = data["show"]["first_aired"].string{
            self.first_aired = first_aired
        }
        
        self.runtime = data["show"]["runtime"].int
        self.certification = data["show"]["certification"].string
        self.network = data["show"]["network"].string
        self.country = data["show"]["country"].string
        self.updated_at = data["show"]["updated_at"].string
        self.trailer = data["show"]["trailer"].string
        self.homepage = data["show"]["homepage"].string
        self.status = data["show"]["status"].string
        self.rating = data["show"]["rating"].double
        self.votes = data["show"]["votes"].int
        self.language = data["show"]["language"].string
        self.available_translations = data["show"]["available_translations"].arrayObject as! Array<String>?
        self.genres = (data["show"]["genres"]).arrayObject as! Array<String>?
        
        if let aired_episodes = data["show"]["aired_episodes"].int{
            self.aired_episodes = aired_episodes
        }
        
    }
    
}
