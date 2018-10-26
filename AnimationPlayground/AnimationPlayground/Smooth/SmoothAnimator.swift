//
//  SmoothAnimator.swift
//  AnimationPlayground
//
//  Created by Tim Shadel on 10/26/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class SmoothAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // TODO
    }

}
