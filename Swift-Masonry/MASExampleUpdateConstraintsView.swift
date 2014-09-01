//
//  MASExampleUpdateConstraintsView.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 8/31/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleUpdateConstraintsView: MASExampleView {
    var growingButton: UIButton!
    var buttonSize: CGSize!
    
    // MARK: - Initialization Method(s)
    
    override func commonInit() {
        growingButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        growingButton.setTitle("Grow Me!", forState: UIControlState.Normal)
        growingButton.layer.borderColor = UIColor.greenColor().CGColor
        growingButton.layer.borderWidth = 3
        
        growingButton.addTarget(self, action: "didTapGrowButton:", forControlEvents: UIControlEvents.TouchUpInside)
        addSubview(growingButton)
        
        buttonSize = CGSizeMake(100, 100)
        
        setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        growingButton.mas_updateConstraints { make in
            make.center.equalTo()(self)
            make.width.equalTo()(self.buttonSize.width).priorityLow()()
            make.height.equalTo()(self.buttonSize.height).priorityLow()()
            make.width.lessThanOrEqualTo()(self)
            make.height.lessThanOrEqualTo()(self)
        }
        
        super.updateConstraints()
    }
    
    func didTapGrowButton(sender: UIButton) {
        var multiplier: CGFloat = 1.3
        buttonSize = CGSizeMake(buttonSize.width * multiplier, buttonSize.height * multiplier)
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
        UIView.animateWithDuration(0.4) {
            self.layoutIfNeeded()
        }
    }
}
