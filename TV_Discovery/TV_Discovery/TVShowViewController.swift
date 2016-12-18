//
//  TVShowViewController.swift
//  TV_Discovery
//
//  Created by iOSKurs on 28.11.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit
class TVShowViewController : UITableViewController{
    //var src = TVShowTableViewSource()
    var Shows : [Show]?
    var date : NSDate?
    var dateToday = NSCalendar.current
    
    @IBOutlet weak var TableViewTitle: UINavigationItem!
    
    @IBAction func NextDayButtonClick(_ sender: UIBarButtonItem) {
        
        let newDate = dateToday.date(byAdding: .day, value: 1, to: date as! Date)
        viewDidLoad(date : newDate! as NSDate)
    }
    
    @IBAction func PreviousDayButtonClick(_ sender: UIBarButtonItem) {
        let newDate = dateToday.date(byAdding: .day, value: -1, to: date as! Date)
        viewDidLoad(date : newDate! as NSDate)
    }
    
    
    
    public override func viewDidLoad() {
        self.date = NSDate()
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "dd.MM.yyyy"
        TableViewTitle.title = mydateformatter.string(from: self.date as! Date)
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        LoadingOverlay.shared.showOverlay(view: self.view)
        
        WebServiceManager.Instance.GetCurrentShows(onCompletion: {(shows:[Show]) in
            self.Shows = shows.filter(){
                if let rating = ($0 as Show).rating as Double?, let ids = ($0 as Show).ids, let id = ids.trakt{
                    if let fs = LocalDataHandler.FavSeries,fs.contains(id){
                        ($0 as Show).isFavorite = true
                    }
                    
                    if  let hs = LocalDataHandler.HiddenSeries{
                        return rating > 5 && !hs.contains(id)
                    }
                    else{
                        return rating > 5
                    }
                    
                    
                }else {
                    return false
                }
            }
            self.tableView.reloadData()
            LoadingOverlay.shared.hideOverlayView()
        })
        
    }
    public func viewDidLoad(date : NSDate){
        self.date = date
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "dd.MM.yyyy"
        TableViewTitle.title = mydateformatter.string(from: self.date as! Date)
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        LoadingOverlay.shared.showOverlay(view: self.view)
        
        WebServiceManager.Instance.GetShowsByDate(date: self.date as! Date, onCompletion: {(shows:[Show]) in
            self.Shows = shows.filter(){
                if let rating = ($0 as Show).rating as Double?, let ids = ($0 as Show).ids, let id = ids.trakt{
                    if let fs = LocalDataHandler.FavSeries,fs.contains(id){
                        ($0 as Show).isFavorite = true
                    }
                    
                    if  let hs = LocalDataHandler.HiddenSeries{
                        return rating > 5 && !hs.contains(id)
                    }
                    else{
                        return rating > 5
                    }
                    
                    
                }else {
                    return false
                }
            }
            self.tableView.reloadData()
            LoadingOverlay.shared.hideOverlayView()
        })
        
        //self.navigationController?.viewControllers.append(self)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let shows = Shows,let view = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? TVShowDetailViewController else {
            return
        }
        
        if indexPath.section == 0{
            let s = shows.filter(){
                return ($0 as Show).isFavorite
                }[indexPath.row]
            
            view.myShow = s
        }else if indexPath.section == 1{
            let s = shows.filter(){
                return !($0 as Show).isFavorite
                }[indexPath.row]
            view.myShow = s
        }else
        {
            return
        }
        
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deletebutton = UITableViewRowAction(style:.default,title:"Delete",handler:{(action,indexPath) in
            var tshow : Show?
            if indexPath.section == 0{
                tshow = self.Shows?.filter(){
                    return ($0 as Show).isFavorite
                }[indexPath.row]
            
            }else{
                tshow = self.Shows?.filter(){
                    return !($0 as Show).isFavorite
                }[indexPath.row]
            }
            
            guard let show = tshow else{
                return
            }
            
            if show.isFavorite{
                LocalDataHandler.FavSeries?.remove(at: (LocalDataHandler.FavSeries?.index(of:show.ids!.trakt!))!)
            }
            
            LocalDataHandler.HiddenSeries?.append(show.ids!.trakt!)
            LocalDataHandler.WriteData()
            
            self.Shows!.remove(at: (self.Shows! as NSArray).index(of: show))
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
                
        })
        deletebutton.backgroundColor = UIColor.red
        let favbutton = UITableViewRowAction(style:.default,title:"Favorite",handler:{(action,indexPath) in
            
            var tshow : Show?
            if indexPath.section == 0{
                tshow = self.Shows?.filter(){
                    return ($0 as Show).isFavorite
                    }[indexPath.row]
                
            }else{
                tshow = self.Shows?.filter(){
                    return !($0 as Show).isFavorite
                    }[indexPath.row]
            }
            
            guard let show = tshow else{
                return
            }
            
            LocalDataHandler.FavSeries?.append(show.ids!.trakt!)
            LocalDataHandler.WriteData()
            show.isFavorite = !show.isFavorite
            
            
            tableView.reloadData();
            
        })
        favbutton.backgroundColor = UIColor.green
        
        return [deletebutton,favbutton]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let shows = Shows{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TVShowCell") as! TVShowTableViewCell
            cell.Shows = shows.filter(){
                return indexPath.section == 0 ? ($0 as Show).isFavorite : !($0 as Show).isFavorite
                }[indexPath.row]
            return cell
            
        }
        return UITableViewCell()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Favorites"
        }else{
            return "Others"
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
