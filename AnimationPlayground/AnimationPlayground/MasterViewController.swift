//
//  MasterViewController.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/24/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var animator: ScreenshotAnimator?

    var detailViewController: DetailViewController? = nil
    let movies = DataController.shared.starWarsMovies
    var selectedTag: Int = 0

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
        let movie = movies[indexPath.row]
        controller.movie = movie
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MovieOverviewCell else { return UITableViewCell() }

        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        cell.imageView?.tag = indexPath.row
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController else { fatalError() }
        nextViewController.movie = movies[indexPath.row]
        nextViewController.loadViewIfNeeded()
        
        setViewsToTransition(for: tableView.cellForRow(at: indexPath) as? MovieOverviewCell, to: nextViewController)
        
        navigationController?.delegate = self
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func setViewsToTransition(for cell: MovieOverviewCell?, to nextVC: DetailViewController) {
        guard let cell = cell else { fatalError() }
        animator = ScreenshotAnimator(views: [(from: cell.episodeLabel, to: nextVC.episodeLabel), (from: cell.movieImageView, to: nextVC.movieImageView)])
    }
}

extension MasterViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.animator
    }
    
}


//
//class MagicAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 1
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        
//        guard let fromVC = transitionContext.viewController(forKey: .from) as? MasterViewController, let toVC = transitionContext.viewController(forKey: .to), let fromView = transitionContext.view(forKey: .from), let toView = transitionContext.view(forKey: .to)
//            else { return }
//        
//        let container = transitionContext.containerView
//        
//        guard let startingView = fromView.findSubview(with: fromVC.selectedTag), let endingView = toView.findSubview(with: 3) else { fatalError() }
//        let startingFrame = startingView.frame
//        let endingFrame = endingView.frame
//        
//        container.addSubview(toVC.view)
//        toVC.view.frame = fromVC.view.frame
//        startingView.isHidden = true
//        toVC.view.alpha = 0
//        endingView.frame = startingFrame
//        
//        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveLinear, animations: {
//            toVC.view.alpha = 1
//            endingView.frame = endingFrame
//        }) { (position) in
//            let success = !transitionContext.transitionWasCancelled
//            
//            switch position {
//            case .current, .start:
//                if !success {
//                    toView.removeFromSuperview()
//                }
//            case .end:
//                toVC.view.frame.origin.x = 0
//            }
//            transitionContext.completeTransition(success)
//        }
//        
////        transitionContext.finalFrame(for: fromVC)
//    }
//}
//
//class Transitioner: NSObject, UIViewControllerTransitioningDelegate {
//    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return MagicAnimator()
//    }
//    
//    
////    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
////
////    }
//    
////    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
////
////    }
//    
//
//    //    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//    //
//    //    }
//
//    //    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//    //
//    //    }
//    
//}
//
//
//
//
//
//extension UIView {
//    func findSubview(with tag: Int) -> UIView? {
//        for view in subviews {
//            if view.tag == tag {
//                return view
//            } else if let subView = view.findSubview(with: tag) {
//                return subView
//            }
//        }
//        return nil
//    }
//}

