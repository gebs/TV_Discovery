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
    var src = TVShowTableViewSource()
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
        mydateformatter.dateFormat = "yyyy-MM-dd"
        TableViewTitle.title = mydateformatter.string(from: self.date as! Date)
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = src
        self.tableView.delegate = src
        LoadingOverlay.shared.showOverlay(view: self.view)
        
        WebServiceManager.Instance.GetCurrentShows(onCompletion: {(shows:[Show]) in
            self.src.Shows = shows
            self.tableView.reloadData()
            LoadingOverlay.shared.hideOverlayView()
        })
        
    }
    
    public func viewDidLoad(date : NSDate){
        self.date = date
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "yyyy-MM-dd"
        TableViewTitle.title = mydateformatter.string(from: self.date as! Date)
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = src
        self.tableView.delegate = src
        LoadingOverlay.shared.showOverlay(view: self.view)
        
        WebServiceManager.Instance.GetShowsByDate(date: self.date as! Date, onCompletion: {(shows:[Show]) in
            self.src.Shows = shows
            self.tableView.reloadData()
            LoadingOverlay.shared.hideOverlayView()
        })
        
        
    }
    
}
