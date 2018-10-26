//
//  TransitionAnimator.swift
//  AnimationPlayground
//
//  Created by Parker Rushton on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var isPresenting = true
    var originFrame = CGRect.zero
    fileprivate let duration = 1.0
    var dismissCompletion: (() -> Void) = { }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let detailView = isPresenting ? toView : transitionContext.view(forKey: .from)!
        
        let initialFrame = isPresenting ? originFrame : detailView.frame
        let finalFrame = isPresenting ? detailView.frame : originFrame
        
        let xScaleFactor = isPresenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScaleFactor = isPresenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height

        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        if isPresenting {
            detailView.transform = scaleTransform
            detailView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            detailView.clipsToBounds = true
        }
        containerView.addSubview(toView)
        containerView.bringSubviewToFront(detailView)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            detailView.transform = self.isPresenting ? CGAffineTransform.identity : scaleTransform
            detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }) { _ in
            if !self.isPresenting {
                self.dismissCompletion()
            }
            transitionContext.completeTransition(true)
        }
    }
    
}
