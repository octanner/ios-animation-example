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
    
    fileprivate func present(_ movie: StarWarsMovie) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailId = String(describing: DetailViewController.self) + "Nav"
        guard let detailNav = mainStoryboard.instantiateViewController(withIdentifier: detailId) as? UINavigationController, let detailVC = detailNav.viewControllers.first as? DetailViewController else { return }
        detailNav.hero.isEnabled = true
        detailVC.hero.isEnabled = true
        detailVC.hero.modalAnimationType = HeroDefaultAnimationType.fade
        detailVC.movie = movie
        detailVC.loadViewIfNeeded()
        detailVC.movieImageView.hero.id = imageId(for: movie)
        detailVC.titleLabel.hero.id = movie.title
        detailVC.episodeLabel.hero.id = String(movie.episodeNumber)
        detailVC.yearLabel.hero.id = String(movie.releaseYear)
        DispatchQueue.main.async {
            self.present(detailNav, animated: true, completion: nil)
        }
    }
    
    fileprivate func imageId(for movie: StarWarsMovie) -> String {
        return "starWarsMovieImage\(movie.episodeNumber)"
    }
    
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
        cell.movieImageView.hero.id = imageId(for: movie)
        cell.titleLabel.hero.id = movie.title
        cell.episodeLabel.hero.id = String(movie.episodeNumber)
        cell.yearLabel.hero.id = String(movie.releaseYear)
        return cell
    }

}

extension MasterViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        present(movie)
    }
    
}
