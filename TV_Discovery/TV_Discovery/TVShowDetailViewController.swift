//
//  TVShowDetailViewController.swift
//  TV_Discovery
//
//  Created by iOSKurs on 12.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit
class TVShowDetailViewController : UITableViewController{
    var src = TVShowDetailTableViewSource()
    public var myShow: Show?

    public override func viewDidLoad() {
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = src
        self.tableView.delegate = src
        LoadingOverlay.shared.showOverlay(view: self.view)

        WebServiceManager.Instance.GetSeasonsByShow(id:(myShow?.ids?.trakt!)!, onCompletion: {(seasons:[Season]) in
            self.src.Show = self.myShow!
            self.src.Seasons = seasons
            self.tableView.reloadData()
        })
        
    }

}
