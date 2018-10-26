//
//  StarWarsMovie.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/24/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

struct StarWarsMovie {
    let title: String
    let image: UIImage
    let releaseYear: Int
    let episodeNumber: Int
    let openingCrawlText: String
    let itunesURL: URL
    let trailerURL: URL
    
    init(title: String, image: UIImage, releaseYear: Int, episodeNumber: Int, openingCrawlText: String, itunesURL: URL, trailerURLString: String) {
        self.title = title
        self.image = image
        self.releaseYear = releaseYear
        self.episodeNumber = episodeNumber
        self.openingCrawlText = openingCrawlText
        self.itunesURL = itunesURL
        self.trailerURL = Bundle.main.url(forResource: trailerURLString, withExtension: "mp4")!
    }
}
