//
//  DetailViewController.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/24/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit
import AVKit

class DetailViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var crawlLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!

    
    // MARK: - Variables
    
    var movie: StarWarsMovie!
    
    
    // MARK: - Actions

    override func viewWillAppear(_ animated: Bool) {
        movieImageView.image = movie.image
        episodeLabel.text = "Episode \(movie.episodeNumber)"
        titleLabel.text = movie.title
        yearLabel.text = "\(movie.releaseYear)"
        crawlLabel.text = movie.openingCrawlText
        movieImageView.isUserInteractionEnabled = true
    }
    
    @objc func userTapped() {
        guard let navController = self.navigationController else { return }
        if navController.isNavigationBarHidden {
            navController.setNavigationBarHidden(false, animated: false)
        } else {
            navController.setNavigationBarHidden(true, animated: false)
        }
    }
}

