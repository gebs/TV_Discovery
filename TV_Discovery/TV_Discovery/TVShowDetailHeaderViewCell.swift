//
//  TVShowDetailHeaderViewCell.swift
//  TV_Discovery
//
//  Created by iOSKurs on 12.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit

class TVShowDetailHeaderViewCell : UITableViewCell{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblDescr: UILabel!

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
                self.lblTitle.text = show.title == "" ? "TBA" : show.title
                self.lblDescr.text = show.overview
                if let year = show.year{
                    self.lblYear.text =  String(year)
                }
                if let rating = show.rating{
                    self.lblRating.text = String(round(rating*10)/10)
                }
               
            }
        }
    }


}
