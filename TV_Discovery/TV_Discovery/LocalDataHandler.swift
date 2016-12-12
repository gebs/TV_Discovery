
//
//  LocalDataHandler.swift
//  TV_Discovery
//
//  Created by iOSKurs on 05.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit
class LocalDataHandler{
    public static var HiddenSeries : [Int]?
    public static var FavSeries : [Int]?
    static let hskey = "HiddenSeries"
    static let favkey = "FavSeries"
    
        
    static func ReadData(){
        let defaults = UserDefaults.standard
        if let series = defaults.array(forKey: hskey){
            HiddenSeries = series as? [Int]
        }else{
            HiddenSeries = [Int]()
        }
        if let favseries = defaults.array(forKey:favkey){
            FavSeries = favseries as? [Int]
        }else
        {
            FavSeries = [Int]()
        }
    }
    
    static func WriteData(){
        let defaults = UserDefaults.standard
        
        defaults.set(HiddenSeries,forKey:hskey)
        defaults.set(FavSeries,forKey:favkey)
        defaults.synchronize()
        
    }
    
    private init(){
    }
    
    
    
}
