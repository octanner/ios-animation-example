//
//  MovieCollectionController.swift
//  AnimationPlayground
//
//  Created by Tim Shadel on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

class MovieCollectionController: UICollectionViewController {
    
    var detailViewController: DetailViewController? = nil
    let movies = DataController.shared.starWarsMovies

    // MARK: - Segues
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? DetailViewController, let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        let movie = movies[indexPath.row]
        controller.movie = movie
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? MovieCollectionCell else { return UICollectionViewCell() }
        
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        
        return cell
    }
    
}
