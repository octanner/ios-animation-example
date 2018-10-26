//
//  VideoPlayerViewController.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayerViewController: UIViewController {

    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    
    var movie: StarWarsMovie!
    var player: AVPlayer!
    var playerViewController = AVPlayerViewController()
    
    @IBAction func openItunesTapped(_ sender: Any) {
        UIApplication.shared.open(movie.itunesURL, options: [:], completionHandler: nil)
    }

    
    override func viewDidLoad() {
        episodeLabel.text = "Episode \(movie.episodeNumber)"
        titleLabel.text = movie.title
        yearLabel.text = "\(movie.releaseYear)"
        player = AVPlayer(url: movie.trailerURL)
        playerViewController.player = player
        playerViewController.view.frame = videoPlayerView.frame
        self.addChild(playerViewController)
        videoPlayerView.addSubview(playerViewController.view)
    }
//
//    var player: AVPlayer!
//    var avpController = AVPlayerViewController()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let moviePath = NSBundle.mainBundle().pathForResource("Hello Moto", ofType: "mp4")
//        if let path = moviePath {
//            let url = NSURL.fileURLWithPath(path)
//            self.player = AVPlayer(url: url)
//            self.avpController = AVPlayerViewController()
//            self.avpController.player = self.player
//            avpController.view.frame = videoPreviewLayer.frame
//            self.addChildViewController(avpController)
//            self.view.addSubview(avpController.view)
//        }
//        // Do any additional setup after loading the view.
//    }

    
}
