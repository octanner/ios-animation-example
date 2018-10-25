//
//  MovieCollectionCell.swift
//  AnimationPlayground
//
//  Created by Tim Shadel on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with movie: StarWarsMovie) {
        self.movieImageView.image = movie.image
        episodeLabel.text = "Episode: \(movie.episodeNumber)"
        titleLabel.text = movie.title
    }
    
}
