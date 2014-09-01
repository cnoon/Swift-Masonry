//
//  MASExampleView.swift
//  Swift-Masonry
//
//  Created by Noon, Christian on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleView: UIView {
    
    // MARK: - Initialization Method(s)
    
    required override init() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        fatalError("commonInit() MUST be overridden by a subclass")
    }
}
