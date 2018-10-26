//
//  TrailerCollectionViewCell.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit
import AVKit

class TrailerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playerContainerView: UIView!
    
    var playerViewController: AVPlayerViewController!
    
    func configure(with movie: StarWarsMovie, playerViewController: AVPlayerViewController) {
        titleLabel.text = movie.title
        self.playerViewController = playerViewController
        let player = AVPlayer(url: movie.trailerURL)
        playerViewController.player = player
        playerViewController.view.frame = playerContainerView.bounds
        playerContainerView.addSubview(playerViewController.view)
    }
    
    override func prepareForReuse() {
        playerViewController.willMove(toParent: nil)
        playerContainerView.subviews.forEach({ $0.removeFromSuperview() })
        playerViewController.removeFromParent()
        super.prepareForReuse()
    }
    
}
