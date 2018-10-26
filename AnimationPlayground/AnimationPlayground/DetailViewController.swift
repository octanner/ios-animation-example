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
    internal var crawlAnimation = UIViewPropertyAnimator(duration: 80, curve: .linear)
    internal var themeColorAnimation: UIViewPropertyAnimator!
    internal var allAnimations = [UIViewPropertyAnimator]()
    internal var player: AVAudioPlayer!
    /// set this variable to false if the beauty is too much for you...
    private let shouldDoDelightfulAnimations = true
    var playButton: UIBarButtonItem!
    var pauseButton: UIBarButtonItem!
    var openButton: UIBarButtonItem!
    
    
    // MARK: - Actions
    
    @IBAction func pausePlayTapped(_ sender: Any) {
        if navigationItem.rightBarButtonItem == playButton {
            navigationItem.setRightBarButton(pauseButton, animated: true)
            if crawlAnimation.state != .inactive {
                setAnimations(toPause: false)
            }
        } else {
            navigationItem.setRightBarButton(playButton, animated: true)
            setAnimations(toPause: true)
        }
    }
    

    // MARK: - Methods
    
    override func viewDidLoad() {
        pauseButton = UIBarButtonItem(barButtonSystemItem: .pause, target: self, action: #selector(pausePlayTapped(_:)))
        playButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(pausePlayTapped(_:)))
        openButton = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openMovieUrl))
        navigationItem.setRightBarButton(openButton, animated: false)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userTapped)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        movieImageView.image = movie.image
        episodeLabel.text = "Episode: \(movie.episodeNumber)"
        titleLabel.text = movie.title
        yearLabel.text = "\(movie.releaseYear)"
        crawlLabel.text = movie.openingCrawlText
        movieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMovieUrl)))
        movieImageView.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if shouldDoDelightfulAnimations {
            setupAndStartAnimations()
            allAnimations.append(crawlAnimation)
            allAnimations.append(themeColorAnimation)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cancelAnimations()
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

