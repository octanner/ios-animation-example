//
//  DataController.swift
//  AnimationPlayground
//
//  Created by Benjamin Patch on 10/24/18.
//  Copyright © 2018 OC Tanner. All rights reserved.
//

import UIKit

struct DataController {
    static var shared = DataController()
    var starWarsMovies: [StarWarsMovie]
    
    init() {
        let movies = [
            StarWarsMovie(title: "The Phantom Menace", image: #imageLiteral(resourceName: "episode1"), releaseYear: 1999, episodeNumber: 1, openingCrawlText: "Turmoil has engulfed the Galactic Republic. The taxation of trade routes to outlying star systems is in dispute.\n\nHoping to resolve the matter with a blockade of deadly battleships, the greedy Trade Federation has stopped all shipping to the small planet of Naboo.\n\nWhile the congress of the Republic endlessly debates this alarming chain of events, the Supreme Chancellor has secretly dispatched two Jedi Knights, the guardians of peace and justice in the galaxy, to settle the conflict…", itunesURL: URL(string: "https://itunes.apple.com/us/movie/star-wars-the-phantom-menace/id975080816")!),
            StarWarsMovie(title: "Attack of the Clones", image: #imageLiteral(resourceName: "episode2"), releaseYear: 2002, episodeNumber: 2, openingCrawlText: "There is unrest in the Galactic Senate. Several thousand solar systems have declared their intentions to leave the Republic.\n\nThis separatist movement, under the leadership of the mysterious Count Dooku, has made it difficult for the limited number of Jedi Knights to maintain peace and order in the galaxy.\n\nSenator Amidala, the former Queen of Naboo, is returning to the Galactic Senate to vote on the critical issue of creating an ARMY OF THE REPUBLIC to assist the overwhelmed Jedi....", itunesURL: URL(string: "https://itunes.apple.com/us/movie/star-wars-attack-of-the-clones/id975101586")!),
            StarWarsMovie(title: "Revenge of the Sith", image: #imageLiteral(resourceName: "episode3"), releaseYear: 2005, episodeNumber: 3, openingCrawlText: "War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku. There are heroes on both sides. Evil is everywhere.\n\nIn a stunning move, the fiendish droid leader, General Grievous, has swept into the Republic capital and kidnapped Chancellor Palpatine, leader of the Galactic Senate. As the Separatist Droid Army attempts to flee the besieged capital with their valuable hostage, two Jedi Knights lead a desperate mission to rescue the captive Chancellor....", itunesURL: URL(string: "https://itunes.apple.com/us/movie/star-wars-revenge-of-the-sith/id975521762")!),
            StarWarsMovie(title: "A New Hope", image: #imageLiteral(resourceName: "episode4"), releaseYear: 1977, episodeNumber: 4, openingCrawlText: "It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire.\n\nDuring the battle, Rebel spies managed to steal secret plans to the Empire's ultimate weapon, the DEATH STAR, an armored space station with enough power to destroy an entire planet.\n\nPursued by the Empire's sinister agents, Princess Leia races home aboard her starship, custodian of the stolen plans that can save her people and restore freedom to the galaxy....", itunesURL: URL(string: "https://itunes.apple.com/us/movie/star-wars-a-new-hope/id978943481")!),
            StarWarsMovie(title: "The Empire Strikes Back", image: #imageLiteral(resourceName: "episode5"), releaseYear: 1980, episodeNumber: 5, openingCrawlText: "It is a dark time for the Rebellion. Although the Death Star has been destroyed, Imperial troops have driven the Rebel forces from their hidden base and pursued them across the galaxy.\n\nEvading the dreaded Imperial Starfleet, a group of freedom fighters led by Luke Skywalker has established a new secret base on the remote ice world of Hoth.\n\nThe evil lord Darth Vader, obsessed with finding young Skywalker, has dispatched thousands of remote probes into the far reaches of space....", itunesURL: URL(string: "https://itunes.apple.com/us/movie/star-wars-the-empire-strikes-back/id975793398")!),
            StarWarsMovie(title: "Return of the Jedi", image: #imageLiteral(resourceName: "episode6"), releaseYear: 1983, episodeNumber: 6, openingCrawlText: "Luke Skywalker has returned to his home planet of Tatooine in an attempt to rescue his friend Han Solo from the clutches of the vile gangster Jabba the Hutt.\n\nLittle does Luke know that the GALACTIC EMPIRE has secretly begun construction on a new armored space station even more powerful than the first dreaded Death Star.\n\nWhen completed, this ultimate weapon will spell certain doom for the small band of rebels struggling to restore freedom to the galaxy…", itunesURL: URL(string: "https://itunes.apple.com/us/movie/star-wars-return-of-the-jedi/id976965981")!)
            ]

        self.starWarsMovies = movies
    }
}
