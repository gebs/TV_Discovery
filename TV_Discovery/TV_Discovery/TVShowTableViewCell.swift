//
//  TVShowTableViewCell.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class TVShowTableViewCell : UITableViewCell{
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblEpisode: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblDescr: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    private var show:Show?
    public var Shows:Show{
        get{
            if let _show = show{
                return _show
            }
            return Show()
            
        }
        set(newValue){
            show = newValue
            if let show = show{
                self.backgroundColor = show.isFavorite ? UIColor.green : UIColor.white
                self.lblTitle.text = show.title
                self.lblDescr.text = show.overview
                if let year = show.year{
                  self.lblYear.text =  String(year)
                }
                if let rating = show.rating{
                    self.lblRating.text = String(round(rating*10)/10)
                }
                if let episode = show.episode?.number, let season = show.episode?.season{
                    self.lblEpisode.text = "S" + (String(season).characters.count > 1 ? "" : "0") + String(season) + "E" + (String(episode).characters.count > 1 ? "" : "0") + String(episode)
                }
            }
            if let tvdbid = show?.ids?.tvdb{
                let url = "http://thetvdb.com/banners/posters/"+String(tvdbid)+"-1.jpg"
                self.imgPoster.sd_setImage(with: URL(string:url)!)  
            }
        }
    }
    
    
    
}
