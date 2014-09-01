//
//  MASExampleViewController.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleViewController: UIViewController {
    var exampleTitle: String!
    var exampleViewType: NSObject.Type!
    
    // MARK: - Initialization Method(s)
    
    convenience init(exampleTitle: String, exampleViewType: NSObject.Type) {
        self.init(nibName: nil, bundle: nil)
        
        self.exampleTitle = exampleTitle
        self.exampleViewType = exampleViewType
        
        title = exampleTitle
        edgesForExtendedLayout = UIRectEdge.None
    }

    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle Method(s)
    
    override func loadView() {
        super.loadView()

        if let exampleView = exampleViewType() as? UIView {
            view = exampleView
        }
        
        view.backgroundColor = UIColor.whiteColor()
    }
}
