//
//  ScreenshotTransition.swift
//  transitionsPlayground
//
//  Created by Benjamin Patch on 10/29/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit


class ScreenshotAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let views: [(from: UIView, to: UIView)]
    
    init(views: [(from: UIView, to: UIView)]) {
        self.views = views
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // nicknames
        let context = transitionContext
        let containerView = context.containerView
        
        // get the goods
        guard let fromVC = context.viewController(forKey: .from),
            let toVC = context.viewController(forKey: .to),
            let fromView = context.view(forKey: .from),
            let toView = context.view(forKey: .to)
            else {
                // TODO: fallback to a basic push/pop animation.
                fatalError()
        }
        
        
        // MARK: SETUP
        
        // setup utility variables
        let fromFrames = views.map { containerView.convert($0.from.frame, from: $0.from.superview) }
        let toFrames = views.map { containerView.convert($0.to.frame, from: $0.to.superview) }
        let tempViews = views.map { $0.from.snapshotView(afterScreenUpdates: false)! }
        let fromAlphas = views.map { $0.from.alpha }
        let toAlphas = views.map { $0.to.alpha }

        // add views to the containerView
        containerView.addSubview(toView)
        toView.alpha = 0
        let backgroundView = UIView(frame: toView.frame)
        backgroundView.backgroundColor = fromView.backgroundColor
        containerView.addSubview(backgroundView)
        backgroundView.frame = toView.frame//.inset(by: toView.safeAreaInsets)

        // take screenshots
        views.forEach { $0.from.alpha = 0; $0.to.alpha = 0 }
        let fromViewScreenshot = fromView.snapshotView(afterScreenUpdates: true)!
        fromView.layoutIfNeeded()
        toView.layoutIfNeeded()
        toView.updateConstraints()
//        backgroundView.addSubview(fromViewScreenshot)
//        containerView.addSubview(fromViewScreenshot)
//        fromViewScreenshot.frame = backgroundView.frame
        fromViewScreenshot.frame = toView.frame
        
        
        // setup screenshot views' frames
        for (index, tempView) in tempViews.enumerated() {
            containerView.addSubview(tempView)
            tempView.frame = fromFrames[index]
        }
        
        // Animate!
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3, delay: 0, options: .curveLinear, animations: {
            
            
            // MARK: ANIMATIONS
            
            backgroundView.alpha = 0
            for (index, tempView) in tempViews.enumerated() {
                tempView.frame = toFrames[index]
                tempView.alpha = toAlphas[index]
            }
            toView.alpha = 1
            fromViewScreenshot.alpha = 0
        }) { (position) in
            
            
            // MARK: CLEANUP
            
            // remove unused views
            tempViews.forEach({ $0.removeFromSuperview() })

            fromViewScreenshot.removeFromSuperview()
            backgroundView.removeFromSuperview()

            // reset fromView's alphas
            for (index, tuple) in self.views.enumerated() {
                tuple.from.alpha = fromAlphas[index]
                tuple.to.alpha = toAlphas[index]
            }
            
            // complete
            context.completeTransition(position == .end)
        }
    }
    
}
