//
//  MASExampleCompositeEdgesView.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 9/1/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleCompositeEdgesView: MASExampleView {

    // MARK: - Initialization Method(s)
    
    override func commonInit() {
        var lastView: UIView = self
        for index in 0..<10 {
            let view = UIView()
            view.backgroundColor = randomColor()
            view.layer.borderColor = UIColor.blackColor().CGColor
            view.layer.borderWidth = 2
            addSubview(view)
            
            view.mas_makeConstraints { make in
                make.top.equalTo()(lastView.mas_top).offset()(5)
                make.left.equalTo()(lastView.mas_left).offset()(10)
                make.bottom.equalTo()(lastView.mas_bottom).offset()(-15)
                make.right.equalTo()(lastView.mas_right).offset()(-20)
            }
            
            lastView = view
        }
    }
    
    func randomColor() -> UIColor {
        var channels = [CGFloat]()
        for _ in 0...2 {
            var channel: CGFloat = CGFloat(arc4random() % UInt32(256)) / 256.0
            channels.append(channel)
        }
        
        return UIColor(red: channels[0], green: channels[1], blue: channels[2], alpha: 1.0)
    }
}
