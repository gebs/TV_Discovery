//
//  TVShowTableViewSources.swift
//  TV_Discovery
//
//  Created by iOSKurs on 01.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit
class TVShowTableViewSource : NSObject,UITableViewDataSource,UITableViewDelegate{
   public var Shows:[Show]?

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let shows = Shows{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCell") as! TVShowTableViewCell
            cell.Shows = shows[indexPath.row]
            return cell
        
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let shows = Shows{
            return shows.count
        }else{
            return 0
        }
    }
}
