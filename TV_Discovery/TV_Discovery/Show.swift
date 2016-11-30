//
//  Show.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation

class Show {
    
    public var title : String
    public var year : Int
    public var ids : Ids
    public var episode : Episode
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
    public var rating : Int?
    public var votes : Int?
    public var language : String?
    public var available_translations : Array<String>?
    public var genres : Array<String>?
    public var aired_episodes : Int?
    
    //Adds the needed values for the simple View
    init(title : String, year : Int, ids : Ids, episode : Episode ) {
        self.title = title
        self.year = year
        self.ids = ids
        self.episode = episode
    }
    
    
    //Adds the needed values for the detailview
    public func addDetails(overview : String, first_aired : String, airs : Airs, runtime : Int, certification : String, network : String, country : String, updated_at : String, trailer : String, homepage : String, status : String, rating : Int, votes : Int, language : String, available_translations : Array<String>, genres : Array<String>, aired_episodes : Int){
        
        self.overview = overview
        self.first_aired = first_aired
        self.airs = airs
        self.runtime = runtime
        self.certification = certification
        self.network = network
        self.country = country
        self.updated_at = updated_at
        self.trailer = trailer
        self.homepage = homepage
        self.status = status
        self.rating = rating
        self.votes = votes
        self.language = language
        self.available_translations = available_translations
        self.genres = genres
        self.aired_episodes = aired_episodes
        
    }
    
    //Returns Id to get details for this show
    public func getId() -> Ids{
        return ids
    }
    
}
