//
//  LoadingOverlay.swift
//  TV_Discovery
//
//  Created by iOSKurs on 03.12.16.
//  Copyright © 2016 iOSKurs. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics
public class LoadingOverlay{
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay(view: UIView) {
        
        overlayView.frame = CGRect(x:0,y:0,width:80,height:80)
        overlayView.center = view.center
        //overlayView.backgroundColor = UIColor(white: 0x444444, alpha: 0.7)
        overlayView.backgroundColor = UIColor(red:10,green:10,blue:10,alpha:0.7)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x:0,y:0,width:40,height:40)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.center = CGPoint(x:overlayView.bounds.width / 2,y:overlayView.bounds.height / 2)
        
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
