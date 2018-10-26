//
//  TrailerCollectionViewCell.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class TrailerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    func configure(with movie: StarWarsMovie) {
        image = movie.image
        imageView.image = movie.image
    }
    
    override func prepareForReuse() {
        self.imageView?.image = nil
        super.prepareForReuse()
    }
    
}
