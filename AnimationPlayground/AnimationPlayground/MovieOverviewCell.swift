//
//  MovieOverviewCell.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/24/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class MovieOverviewCell: UITableViewCell {

        @IBOutlet weak var movieImageView: UIImageView!
        @IBOutlet weak var episodeLabel: UILabel!
        @IBOutlet weak var titleLabel: UILabel!
        @IBOutlet weak var yearLabel: UILabel!
        
    func configure(with movie: StarWarsMovie) {
        self.movieImageView.image = movie.image
        episodeLabel.text = "Episode: \(movie.episodeNumber)"
        titleLabel.text = movie.title
        yearLabel.text = "\(movie.releaseYear)"
    }
}
