//
//  Airs.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation

class Airs {
    
    public var day : String?
    public var time : String?
    public var timezone : String?
    
    init(day : String, time : String, timezone : String){
        self.day = day
        self.time = time
        self.timezone = timezone
    }
}
