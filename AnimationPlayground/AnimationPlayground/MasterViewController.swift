//
//  MasterViewController.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/24/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let movies = DataController.shared.starWarsMovies
    let transitionAnimator = TransitionAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transitionAnimator.dismissCompletion = {
            print("Complete!")
        }
    }

    // MARK: - Segues

    func present(_ movie: StarWarsMovie) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailId = String(describing: DetailViewController.self) + "Nav"
        guard let detailNav = mainStoryboard.instantiateViewController(withIdentifier: detailId) as? UINavigationController, let detailVC = detailNav.viewControllers.first as? DetailViewController else { return }
        detailNav.transitioningDelegate = self
        detailVC.movie = movie
        DispatchQueue.main.async {
            self.present(detailNav, animated: true, completion: nil)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let detailNav = segue.destination as? UINavigationController, let detailVC = detailNav.viewControllers.first as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
//        detailVC.transitioningDelegate = self
//        let movie = movies[indexPath.row]
//        detailVC.movie = movie
//    }
}


// MARK: - Table View

extension MasterViewController {

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
        
        return cell
    }

}

extension MasterViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        present(movie)
    }
    
}


extension MasterViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transitionAnimator.isPresenting = true
        let selectedCell = tableView.cellForRow(at: tableView.indexPathForSelectedRow!)!
        transitionAnimator.originFrame = self.view.convert(selectedCell.frame, to: nil)
        return transitionAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transitionAnimator.isPresenting = false
        return transitionAnimator
    }
    
}
