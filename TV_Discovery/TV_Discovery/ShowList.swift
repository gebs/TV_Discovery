//
//  ShowList.swift
//  TV_Discovery
//
//  Created by iOSKurs on 30.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation

class ShowList {
    
    private var list : [Show] = []
    private var date : Date
    
    init(date : Date){
        self.date = date
    }
    
    public func addShowToList(show : Show){
        list.append(show)
    }
}
