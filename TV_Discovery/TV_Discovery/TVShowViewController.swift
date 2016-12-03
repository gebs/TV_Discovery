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
    
    public override func viewDidLoad() {
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
}
