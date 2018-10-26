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
    var movieImageView: UIImageView!
    var fromImageFrame = CGRect.zero
    var toImageFrame = CGRect.zero
    var duration = 4.0
    var presentingCompletion: (() -> Void) = { }
    var dismissCompletion: (() -> Void) = { }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Attempt 1
//        let containerView = transitionContext.containerView
//        let toView = transitionContext.view(forKey: .to)!
//        containerView.addSubview(toView)
//        toView.alpha = 0
//
//        UIView.animate(withDuration: duration, animations: {
//            toView.alpha = 1
//        }) { _ in
//            transitionContext.completeTransition(true)
//        }
//    }

        // Attempt 2
//        let containerView = transitionContext.containerView
//        let toView = transitionContext.view(forKey: .to)!
//        let detailView = isPresenting ? toView : transitionContext.view(forKey: .from)!
//
//        let initialFrame = isPresenting ? originFrame : detailView.frame
//        let finalFrame = isPresenting ? detailView.frame : originFrame
//
//        let xScaleFactor = isPresenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
//        let yScaleFactor = isPresenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
//
//        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
//        if isPresenting {
//            detailView.transform = scaleTransform
//            detailView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
//            detailView.clipsToBounds = true
//        }
//        containerView.addSubview(toView)
//        containerView.bringSubviewToFront(detailView)
//
//        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
//            detailView.transform = self.isPresenting ? CGAffineTransform.identity : scaleTransform
//            detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
//        }) { _ in
//            if !self.isPresenting {
//                self.dismissCompletion()
//            }
//            transitionContext.completeTransition(true)
//        }
//    }
        
        // Attempt 3
//        let containerView = transitionContext.containerView
//        let toView = transitionContext.view(forKey: .to)!
//        toView.alpha = 0
//
//        let originalImageFrame = isPresenting ? fromImageFrame : toImageFrame
//        let newImageFrame = isPresenting ? toImageFrame : fromImageFrame
//        let xScale = newImageFrame.width / originalImageFrame.width
//        let yScale = newImageFrame.height / originalImageFrame.height
//        let imageScaleTransform = CGAffineTransform(scaleX: xScale, y: yScale)
//        let imageTranslationTransform = CGAffineTransform(translationX: newImageFrame.midX - originalImageFrame.midX, y: newImageFrame.midY - originalImageFrame.midY)
//
//        containerView.addSubview(toView)
//
//        movieImageView.frame = originalImageFrame
//        UIView.animate(withDuration: duration, animations: {
//            self.movieImageView.transform = imageScaleTransform.concatenating(imageTranslationTransform)
//            toView.alpha = 1
//        }) { _ in
//            if self.isPresenting {
//                self.presentingCompletion()
//                self.movieImageView.transform = .identity
//            } else {
//                self.dismissCompletion()
//            }
//            transitionContext.completeTransition(true)
//        }
    }
    
}
