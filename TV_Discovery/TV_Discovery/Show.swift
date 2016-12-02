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
    public var rating : Int?
    public var votes : Int?
    public var language : String?
    public var available_translations : Array<String>?
    public var genres : Array<String>?
    public var aired_episodes : Int?
    
    init(data:JSON){
        if let title = data["show"]["title"].string{
            self.title = title
        }
        if let year = data["show"]["year"].int{
            self.year = year
        }
        if let tids = JSON(data["show"]["ids"]).array{
            
            //TODO: Add IDs
        }
        if let overview = data["show"]["overview"].string{
            self.overview = overview
        }
        if let first_aired = data["show"]["first_aired"].string{
            self.first_aired = first_aired
        }
    }
    init(){
    }
    
}
