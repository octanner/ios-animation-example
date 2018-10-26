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
    var selectedCell: MovieOverviewCell?

    override func viewDidLoad() {
        navigationController?.delegate = self
    }

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
        
        return cell
    }

}


// MARK: - Tableview Delegate

extension MasterViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = tableView.cellForRow(at: indexPath) as? MovieOverviewCell
    }

}


// MARK: - Navigation controller delegate

extension MasterViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return TransitionAnimator(transitionType: .presenting)
        case .pop:
            return TransitionAnimator(transitionType: .dismissing)
        case .none:
            return nil
        }
    }

}
