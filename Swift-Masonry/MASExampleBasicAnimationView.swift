//
//  MASExampleBasicAnimationView.swift
//  Swift-Masonry
//
//  Created by Christian Noon on 9/1/14.
//  Copyright (c) 2014 Noondev. All rights reserved.
//

import UIKit

class MASExampleBasicAnimationView: MASExampleView {
    var animating = false
    var padding: CGFloat = 10.0
    var animatedPadding: CGFloat = 100.0
    var animatableConstraints: [MASConstraint]!

    // MARK: - Initialization Method(s)
    
    override func commonInit() {
        let view1 = UIView()
        view1.backgroundColor = UIColor.greenColor()
        view1.layer.borderColor = UIColor.blackColor().CGColor
        view1.layer.borderWidth = 2
        addSubview(view1)

        let view2 = UIView()
        view2.backgroundColor = UIColor.redColor()
        view2.layer.borderColor = UIColor.blackColor().CGColor
        view2.layer.borderWidth = 2
        addSubview(view2)

        let view3 = UIView()
        view3.backgroundColor = UIColor.blueColor()
        view3.layer.borderColor = UIColor.blackColor().CGColor
        view3.layer.borderWidth = 2
        addSubview(view3)
        
        let superview = self
        let edgeInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        animatableConstraints = [MASConstraint]()
        
        view1.mas_makeConstraints { make in
            self.animatableConstraints.extend([
                make.edges.equalTo()(superview).insets()(edgeInsets).priorityLow()(),
                make.bottom.equalTo()(view3.mas_top).offset()(-10)
            ])

            make.size.equalTo()(view2)
            make.height.equalTo()(view3.mas_height)
        }
        
        view2.mas_makeConstraints { make in
            self.animatableConstraints.extend([
                make.edges.equalTo()(superview).insets()(edgeInsets).priorityLow()(),
                make.left.equalTo()(view1.mas_right).offset()(10),
                make.bottom.equalTo()(view3.mas_top).offset()(-10)
            ])
            
            make.size.equalTo()(view1)
            make.height.equalTo()(view3.mas_height)
        }

        view3.mas_makeConstraints { make in
            self.animatableConstraints.extend([
                make.edges.equalTo()(superview).insets()(edgeInsets).priorityLow()(),
            ])
            
            make.height.equalTo()(view1.mas_height)
            make.height.equalTo()(view2.mas_height)
        }
    }
    
    deinit {
        if animating {
            layer.removeAllAnimations()
        }
    }
    
    // MARK: - Window Method(s)
    
    override func didMoveToWindow() {
        layoutIfNeeded()
        
        if window != nil {
            animating = true
            animateWithInvertedInsets(false)
        }
    }

    // MARK: - Animation Method(s)
    
    func animateWithInvertedInsets(invertedInsets: Bool) {
        if !animating {
            return
        }
        
        let padding = invertedInsets ? self.animatedPadding : self.padding
        var edgeInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        for constraint in animatableConstraints {
            constraint.insets()(edgeInsets)
        }
        
        UIView.animateWithDuration(1.0, animations: {
            self.layoutIfNeeded()
        }, completion: { completed in
            self.animateWithInvertedInsets(!invertedInsets)
        })
    }
}
