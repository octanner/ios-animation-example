//
//  TransitionAnimator.swift
//  AnimationPlayground
//
//  Created by Derik Flanary on 10/26/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {


    enum TransitionType {
        case presenting
        case dismissing
    }

    let duration: TimeInterval = 1.0
    let transitionType: TransitionType

    init(transitionType: TransitionType) {
        self.transitionType = transitionType
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch transitionType {
        case .presenting:
            present(with: transitionContext)
        case .dismissing:
            dismiss(with: transitionContext)
        }
    }

    func frameOfViewInWindowsCoordinateSystem(_ view: UIView) -> CGRect {
        if let superview = view.superview {
            return superview.convert(view.frame, to: nil)
        }
        print("[ANIMATION WARNING] Seems like this view is not in views hierarchy\n\(view)\nOriginal frame returned")
        return view.frame
    }
    
}

private extension TransitionAnimator {

    func present(with transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? MasterViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let toView = transitionContext.view(forKey: .to),
            let fromView = transitionContext.view(forKey: .from) else {
                transitionContext.completeTransition(true)
                return
        }

        let containerView = transitionContext.containerView
        guard let selectedCell = fromViewController.selectedCell else {
            transitionContext.completeTransition(true)
            return
        }
        let movieImageView = UIImageView(image: selectedCell.movieImageView.image)
        movieImageView.contentMode = toViewController.movieImageView.contentMode

        let titleLabel = UILabel()
        titleLabel.text = selectedCell.titleLabel.text
        titleLabel.font = toViewController.titleLabel.font
        titleLabel.textAlignment = toViewController.titleLabel.textAlignment

        let yearLabel = UILabel()
        yearLabel.text = selectedCell.yearLabel.text
        yearLabel.font = toViewController.yearLabel.font
        yearLabel.textAlignment = toViewController.yearLabel.textAlignment

        let episodeLabel = UILabel()
        episodeLabel.text = selectedCell.episodeLabel.text
        episodeLabel.font = toViewController.episodeLabel.font
        episodeLabel.textAlignment = toViewController.episodeLabel.textAlignment

        let relativeCellFrame = frameOfViewInWindowsCoordinateSystem(selectedCell)
        let destinationFrame = toView.frame
        toView.frame = relativeCellFrame
        toView.layoutIfNeeded()
        toView.layer.cornerRadius = 10
        toView.clipsToBounds = true
        containerView.addSubview(toView)

        movieImageView.frame = frameOfViewInWindowsCoordinateSystem(selectedCell.movieImageView)
        titleLabel.frame = frameOfViewInWindowsCoordinateSystem(selectedCell.titleLabel)
        yearLabel.frame = frameOfViewInWindowsCoordinateSystem(selectedCell.yearLabel)
        episodeLabel.frame = frameOfViewInWindowsCoordinateSystem(selectedCell.episodeLabel)

        containerView.add([titleLabel, yearLabel, episodeLabel, movieImageView])

        var movieToFrame = toViewController.movieImageView.frame
        var titleToFrame = toViewController.titleLabel.frame
        var yearToFrame = toViewController.yearLabel.frame
        var episodeToFrame = toViewController.episodeLabel.frame

        if let destinationNavBar = toViewController.navigationController?.navigationBar {
            movieToFrame.origin.y += destinationNavBar.frame.height * 2
            titleToFrame.origin.y += destinationNavBar.frame.height * 2
            yearToFrame.origin.y += destinationNavBar.frame.height * 2
            episodeToFrame.origin.y += destinationNavBar.frame.height * 2
        }

        toViewController.movieImageView.alpha = 0.0
        toViewController.yearLabel.alpha = 0.0
        toViewController.episodeLabel.alpha = 0.0
        toViewController.titleLabel.alpha = 0.0

        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8) {
            movieImageView.frame = movieToFrame
            titleLabel.frame = titleToFrame
            yearLabel.frame = yearToFrame
            episodeLabel.frame = episodeToFrame
            toView.frame = destinationFrame
            toView.clipsToBounds = false
            fromView.alpha = 0.2
        }

        animator.addCompletion { _ in
            movieImageView.removeFromSuperview()
            titleLabel.removeFromSuperview()
            yearLabel.removeFromSuperview()
            episodeLabel.removeFromSuperview()
            toViewController.movieImageView.alpha = 1.0
            toViewController.yearLabel.alpha = 1.0
            toViewController.episodeLabel.alpha = 1.0
            toViewController.titleLabel.alpha = 1.0
            fromView.alpha = 1.0
            transitionContext.completeTransition(true)
        }
        animator.startAnimation()
    }

    func dismiss(with transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) as? DetailViewController,
            let toViewController = transitionContext.viewController(forKey: .to) as? MasterViewController,
            let toView = transitionContext.view(forKey: .to),
            let fromView = transitionContext.view(forKey: .from) else {
                transitionContext.completeTransition(true)
                return
        }

        let containerView = transitionContext.containerView
        guard let selectedCell = toViewController.selectedCell else {
            transitionContext.completeTransition(true)
            return
        }
        let movieImageView = UIImageView(image: selectedCell.movieImageView.image)
        movieImageView.contentMode = fromViewController.movieImageView.contentMode

        let titleLabel = UILabel()
        titleLabel.text = selectedCell.titleLabel.text
        titleLabel.font = selectedCell.titleLabel.font
        titleLabel.textAlignment = selectedCell.titleLabel.textAlignment

        let yearLabel = UILabel()
        yearLabel.text = selectedCell.yearLabel.text
        yearLabel.font = selectedCell.yearLabel.font
        yearLabel.textAlignment = selectedCell.yearLabel.textAlignment

        let episodeLabel = UILabel()
        episodeLabel.text = selectedCell.episodeLabel.text
        episodeLabel.font = selectedCell.episodeLabel.font
        episodeLabel.textAlignment = selectedCell.episodeLabel.textAlignment

        var relativeCellFrame = frameOfViewInWindowsCoordinateSystem(selectedCell)
        relativeCellFrame.origin.y += 88
        toView.alpha = 0.2
        containerView.addSubview(fromView)
        containerView.insertSubview(toView, belowSubview: fromView)

        movieImageView.frame = frameOfViewInWindowsCoordinateSystem(fromViewController.movieImageView)
        titleLabel.frame = frameOfViewInWindowsCoordinateSystem(fromViewController.titleLabel)
        yearLabel.frame = frameOfViewInWindowsCoordinateSystem(fromViewController.yearLabel)
        episodeLabel.frame = frameOfViewInWindowsCoordinateSystem(fromViewController.episodeLabel)

        containerView.add([titleLabel, yearLabel, episodeLabel, movieImageView])

        let movieToFrame = frameOfViewInWindowsCoordinateSystem(selectedCell.movieImageView)
        let titleToFrame = frameOfViewInWindowsCoordinateSystem(selectedCell.titleLabel)
        let yearToFrame = frameOfViewInWindowsCoordinateSystem(selectedCell.yearLabel)
        let episodeToFrame = frameOfViewInWindowsCoordinateSystem(selectedCell.episodeLabel)

        selectedCell.movieImageView.alpha = 0.0
        selectedCell.yearLabel.alpha = 0.0
        selectedCell.episodeLabel.alpha = 0.0
        selectedCell.titleLabel.alpha = 0.0
        fromViewController.movieImageView.alpha = 0.0

        let animator = UIViewPropertyAnimator(duration: duration, dampingRatio: 0.8) {
            movieImageView.frame = movieToFrame
            titleLabel.frame = titleToFrame
            yearLabel.frame = yearToFrame
            episodeLabel.frame = episodeToFrame
            movieImageView.alpha = 1.0
            titleLabel.alpha = 1.0
            yearLabel.alpha = 1.0
            episodeLabel.alpha = 1.0
            fromView.frame = relativeCellFrame
            fromView.backgroundColor = selectedCell.backgroundColor
            fromViewController.backgroundView.backgroundColor = selectedCell.backgroundColor
            toView.alpha = 1.0
            fromViewController.crawlLabel.alpha = 0.0
        }

        animator.addCompletion { _ in
            movieImageView.removeFromSuperview()
            titleLabel.removeFromSuperview()
            yearLabel.removeFromSuperview()
            episodeLabel.removeFromSuperview()
            selectedCell.movieImageView.alpha = 1.0
            selectedCell.yearLabel.alpha = 1.0
            selectedCell.episodeLabel.alpha = 1.0
            selectedCell.titleLabel.alpha = 1.0
            fromView.removeFromSuperview()
            toView.alpha = 1.0
            transitionContext.completeTransition(true)
        }
        animator.startAnimation()
    }

}


extension UIView {
    func add(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }
}
