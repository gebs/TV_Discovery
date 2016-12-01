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
            
            self.lblTitle.text = show?.title
            self.lblDescr.text = show?.network
            //WebServiceManager.Instance.GetShowImages(id: <#T##Int#>, onCompletion: <#T##(String) -> Void#>)
        }
    }
    
    
    
}
