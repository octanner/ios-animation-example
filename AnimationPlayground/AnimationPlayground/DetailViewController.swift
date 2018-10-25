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
    internal let reasonableDelay = 5.0
    internal var crawlAnimation = UIViewPropertyAnimator(duration: 20, curve: .easeInOut)
    internal var themeColorAnimation: UIViewPropertyAnimator!
    internal var player: AVAudioPlayer!
    private let shouldDoDelightfulAnimations = true
    
    // MARK: - Methods
    
    override func viewWillAppear(_ animated: Bool) {
        movieImageView.image = movie.image
        episodeLabel.text = "Episode \(movie.episodeNumber)"
        titleLabel.text = movie.title
        yearLabel.text = "\(movie.releaseYear)"
        crawlLabel.text = movie.openingCrawlText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // set this variable to false if the beauty is too much for you...
        if shouldDoDelightfulAnimations {
            setupAndStartAnimations()
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userTapped)))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cancelAnimations()
    }
    
    @objc func userTapped() {
        guard let navController = self.navigationController else { return }
        if navController.isNavigationBarHidden {
            navController.setNavigationBarHidden(false, animated: false)
        }
    }
}

