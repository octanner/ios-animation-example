//
//  DetailViewControllerExtension.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/25/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit
import AVKit

extension DetailViewController {
   
    // MARK: - Animation Methods
    
    
    internal func setupAndStartAnimations() {
        setupCrawlAnimation()
        setTheMood(after: reasonableDelay)
        
        animateHide(view: titleLabel, afterDelay: reasonableDelay + 1)
        animateHide(view: episodeLabel, afterDelay: reasonableDelay + 2)
        animateHide(view: movieImageView, afterDelay: reasonableDelay + 4)
        animateHide(view: yearLabel, afterDelay: reasonableDelay + 6)
    }
    
    internal func cancelAnimations() {
        crawlAnimation.stopAnimation(true)
        themeColorAnimation.stopAnimation(true)
        player.stop()
    }
    
    private func setupCrawlAnimation() {
        let originY = self.crawlLabel.frame.origin.y
        let offsetForBottomOfLabelToBeAtTopOfView = -self.crawlLabel.frame.height
        crawlAnimation.addAnimations {
            self.crawlLabel.frame.origin.y = offsetForBottomOfLabelToBeAtTopOfView
        }
        crawlAnimation.addCompletion { _ in
            self.resetView(originY: originY)
        }
        crawlAnimation.startAnimation(afterDelay: reasonableDelay)
    }
    
    private func setTheMood(after delay: TimeInterval) {
        // setup themeColorAnimation
        themeColorAnimation = UIViewPropertyAnimator(duration: 2, curve: .easeInOut)
        themeColorAnimation.addAnimations {
            self.backgroundView.backgroundColor = .black
            self.view.backgroundColor = .black
        }
        themeColorAnimation.startAnimation(afterDelay: reasonableDelay)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            // hide nav bar for immersive experience.
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
        
        // apparently you cant annimate textColor, so we just have to delay changing it till the background changes.
        DispatchQueue.main.asyncAfter(deadline: .now() + delay + 1.5) {
            self.titleLabel.textColor = .yellow
            self.episodeLabel.textColor = .yellow
            self.yearLabel.textColor = .yellow
            self.crawlLabel.textColor = .yellow
            // set the mood immersively
            self.playMusic()
            self.hapticHurrah()
        }
    }
    
    private func animateHide(view: UIView, afterDelay delay: TimeInterval, withDuration duration: TimeInterval = 2.0) {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: delay, options: .curveLinear, animations: {
            view.alpha = 0
        }) { (_) in
            view.alpha = 0
        }
    }
    
    private func resetView(originY: CGFloat) {
        crawlLabel.frame.origin.y = originY
        titleLabel.alpha = 1
        episodeLabel.alpha = 1
        movieImageView.alpha = 1
        yearLabel.alpha = 1
        titleLabel.textColor = .black
        episodeLabel.textColor = .black
        yearLabel.textColor = .black
        crawlLabel.textColor = .black
        navigationController!.setNavigationBarHidden(false, animated: true)
        backgroundView.backgroundColor = .white
        view.backgroundColor = .white
    }
    
    
    // MARK: - Other Funnities
    
    private func playMusic() {
        guard let url = Bundle.main.url(forResource: "starWarsIntroMusic", withExtension: "mp3") else { return }
        
        try? AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default, options: [])
        try? AVAudioSession.sharedInstance().setActive(true)
        player = try? AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        
        player?.play()
    }
    
    private func hapticHurrah() {
        let feedback = UIImpactFeedbackGenerator(style: .heavy)
        feedback.impactOccurred()
    }

}
