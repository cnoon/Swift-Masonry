//
//  ExampleListViewController.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class ExampleListViewController: UIViewController {
    
    // MARK: - View Lifecycle Method(s)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInstanceVariables()
    }

    // MARK: - Set Up Method(s)

    func setUpInstanceVariables() {
        title = "Examples"
    }
}
