//
//  TVShowDetailTableViewSource.swift
//  TV_Discovery
//
//  Created by iOSKurs on 12.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit

class TVShowDetailTableViewSource : NSObject,UITableViewDataSource,UITableViewDelegate{
    
    public var Show : Show?
    public var Seasons : [Season]?
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCell") as! TVShowTableViewCell
            cell.Shows = self.Show!
            return cell
        }else if indexPath.section <= (self.Seasons?.count)!{
            let item = self.Seasons![indexPath.section].episodes[indexPath.row]
            let cell = UITableViewCell(style: .default, reuseIdentifier: "EpisodeCell")
            cell.textLabel?.text = item.title
            return cell
        }
        else{
            return UITableViewCell()
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if let seasons = self.Seasons, let _ = self.Show{
            return 1 + seasons.count
        }
        else{
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return ""
        }
        else{
            if let seasons = self.Seasons{
                return "Season " + String(seasons[section - 1].number!)
            }else{
                return ""
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let seasons = self.Seasons, let _ = self.Show{
            if section == 1{
                return 1
            }else if section < seasons.count + 1{
                return seasons[section].episodes.count
            }else {
                return 0
            }
            
        }
        else{
            return 0
        }
        
    }
    
    
}
