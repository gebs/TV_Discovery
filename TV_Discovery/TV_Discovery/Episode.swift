//
//  Episode.swift
//  TV_Discovery
//
//  Created by iOSKurs on 30.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import SwiftyJSON

class Episode{
    
    public var season : Int?
    public var number : Int?
    public var title : String?
    
    init(season : Int, number : Int){
        self.season = season
        self.number = number
    }
    init(data:JSON){
        if let season = data["season"].int{
        self.season = season
        }
        if let number = data["number"].int{
        self.number = number
        }
        if let title = data["title"].string{
            self.title = title
        }
    }
}
