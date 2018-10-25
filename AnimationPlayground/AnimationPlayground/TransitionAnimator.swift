//
//  TransitionAnimator.swift
//  AnimationPlayground
//
//  Created by Parker Rushton on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting: Bool
    fileprivate let duration = 1.0
    
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        containerView.addSubview(toView)
        toView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            toView.alpha = 1
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }
    
}
