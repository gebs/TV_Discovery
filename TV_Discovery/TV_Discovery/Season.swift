//
//  Season.swift
//  TV_Discovery
//
//  Created by iOSKurs on 12.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import SwiftyJSON
class Season {
    public var number :Int?
    public var ids : Ids?
    public var episodes = [Episode]()
    
    init(data:JSON){
        if let number = data["number"].int{
            self.number = number
        }
        if let episodes = data["episodes"].array{
            for eps in episodes{
                self.episodes.append(Episode(data: eps))
            }
        }
    }
}
