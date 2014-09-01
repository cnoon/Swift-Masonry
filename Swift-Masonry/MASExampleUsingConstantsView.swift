//
//  MASExampleUsingConstantsView.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 9/1/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleUsingConstantsView: MASExampleView {
    
    // MARK: - Initialization Method(s)
    
    override func commonInit() {
        let view1 = UIView()
        view1.backgroundColor = UIColor.purpleColor()
        view1.layer.borderColor = UIColor.blackColor().CGColor
        view1.layer.borderWidth = 2
        addSubview(view1)
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.orangeColor()
        view2.layer.borderColor = UIColor.blackColor().CGColor
        view2.layer.borderWidth = 2
        addSubview(view2)
        
        var padding = 20
        
        view1.mas_makeConstraints { make in
            make.top.equalTo()(padding)
            make.left.equalTo()(padding)
            make.bottom.equalTo()(-padding)
            make.right.equalTo()(-padding)
        }

        view2.mas_makeConstraints { make in
            make.centerX.equalTo()(0)
            make.centerY.equalTo()(50)
            make.width.equalTo()(200)
            make.height.equalTo()(100)
        }
    }
}
