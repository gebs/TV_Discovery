//
//  Ids.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation

class Ids {
    
    public var trakt : Int
    public var slug : String?
    public var tvdb : Int?
    public var imdb : String?
    public var tmdb : Int?
    public var tvrage : Int?
    
    init(trakt : Int, slug : String, tvdb : Int, imdb : String, tmdb : Int, tvrage : Int){
        self.trakt = trakt
        self.slug = slug
        self.tvdb = tvdb
        self.imdb = imdb
        self.tmdb = tmdb
        self.tvrage = tvrage
    }
    
}
