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

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deletebutton = UITableViewRowAction(style:.default,title:"Delete",handler:{(action,indexPath) in
            let show = self.Shows![indexPath.row]
            LocalDataHandler.HiddenSeries?.append(show.ids!.trakt!)
            LocalDataHandler.WriteData()
            self.Shows!.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        })
        deletebutton.backgroundColor = UIColor.red
        let favbutton = UITableViewRowAction(style:.default,title:"Favorite",handler:{(action,indexPath) in
            let show = self.Shows![indexPath.row]
            LocalDataHandler.FavSeries?.append(show.ids!.trakt!)
            LocalDataHandler.WriteData()
            show.isFavorite = true
            tableView.reloadRows(at: tableView.indexPathsForVisibleRows!, with: UITableViewRowAnimation.automatic)
        })
        favbutton.backgroundColor = UIColor.green
        
        return [deletebutton,favbutton]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let shows = Shows{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCell") as! TVShowTableViewCell
            cell.Shows = shows.filter(){
                return indexPath.section == 0 ? ($0 as Show).isFavorite : !($0 as Show).isFavorite
                }[indexPath.row]
            return cell
        
        }
        return UITableViewCell()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Favorites"
        }else{
            return "Others"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let shows = Shows{
            if (section == 0){
                return shows.filter(){
                    return ($0 as Show).isFavorite
                }.count
            }else
            {
                return shows.filter(){
                    return !($0 as Show).isFavorite
                }.count
            }
        }else{
            return 0
        }
    }
}
