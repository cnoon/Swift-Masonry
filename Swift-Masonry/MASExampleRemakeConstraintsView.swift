//
//  MASExampleRemakeConstraintsView.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 9/1/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleRemakeConstraintsView: MASExampleView {
    var movingButton: UIButton!
    var topLeft = true

    // MARK: - Initialization Method(s)
    
    override func commonInit() {
        movingButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        movingButton.setTitle("Move Me!", forState: UIControlState.Normal)
        movingButton.layer.borderColor = UIColor.greenColor().CGColor
        movingButton.layer.borderWidth = 3
        
        movingButton.addTarget(self, action: "toggleButtonPosition", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(movingButton)
        
        setNeedsUpdateConstraints()
    }

    // MARK: - Constraint Method(s)
    
    override func updateConstraints() {
        movingButton.mas_remakeConstraints { make in
            make.width.equalTo()(100)
            make.height.equalTo()(100)
            
            if self.topLeft {
                make.left.equalTo()(self.mas_left).with().offset()(10)
                make.top.equalTo()(self.mas_top).with().offset()(10)
            } else {
                make.right.equalTo()(self.mas_right).with().offset()(-10)
                make.bottom.equalTo()(self.mas_bottom).with().offset()(-10)
            }
        }
        
        super.updateConstraints()
    }
    
    // MARK: - UIControl Callback Method(s)
    
    func toggleButtonPosition() {
        topLeft = !topLeft
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
        UIView.animateWithDuration(0.4) {
            self.layoutIfNeeded()
        }
    }
}
