//
//  MASExampleBasicView.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleBasicView: MASExampleView {
    
    // MARK: - Initialization Method(s)

    override func commonInit() {
        let view1 = UIView()
        view1.backgroundColor = UIColor.greenColor()
        view1.layer.borderColor = UIColor.blackColor().CGColor
        view1.layer.borderWidth = 2
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.redColor()
        view2.layer.borderColor = UIColor.blackColor().CGColor
        view2.layer.borderWidth = 2
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.blueColor()
        view3.layer.borderColor = UIColor.blackColor().CGColor
        view3.layer.borderWidth = 2
        
        addSubview(view1)
        addSubview(view2)
        addSubview(view3)
        
        let superview = self
        var padding = 10
        
        view1.mas_makeConstraints { make in
            make.top.greaterThanOrEqualTo()(superview.mas_top).offset()(10)
            make.left.equalTo()(superview.mas_left).offset()(10)
            make.bottom.equalTo()(view3.mas_top).offset()(-10)
            make.right.equalTo()(view2.mas_left).offset()(-10)
            make.width.equalTo()(view2.mas_width)
            make.height.equalTo()(view2.mas_height)
            make.height.equalTo()(view3.mas_height)
        }
        
        view2.mas_makeConstraints { make in
            make.top.equalTo()(superview.mas_top).with().offset()(10)
            make.left.equalTo()(view1.mas_right).offset()(10)
            make.bottom.equalTo()(view3.mas_top).offset()(-10)
            make.right.equalTo()(superview.mas_right).offset()(-10)
            make.width.equalTo()(view1.mas_width)
            make.height.equalTo()([view1, view3])
        }
        
        view3.mas_makeConstraints { make in
            make.top.equalTo()(view1.mas_bottom).offset()(10)
            make.left.equalTo()(superview.mas_left).offset()(10)
            make.bottom.equalTo()(superview.mas_bottom).offset()(-10)
            make.right.equalTo()(superview.mas_right).offset()(-10)
            make.height.equalTo()([view1.mas_height, view2.mas_height])
        }
    }
}
