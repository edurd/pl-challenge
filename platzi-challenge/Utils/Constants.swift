//
//  Constants.swift
//  platzi-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation

struct Constants {
    static let marvelEndpoint = "https://gateway.marvel.com"
    static let marvelApikey = "9443382fb20ccfc90747788180b86388"
    static let marvelDefaultSearch = "Iron man"
    static let marvelHash = "7773424760c80bf92d92328402871f2d"
    static let marvelTs = "1"
    static let getComics = marvelEndpoint + "/v1/public/comics"

    static let pexelsEndpoint = "https://api.pexels.com"
    static let pexelsApiKey = "2QSHwY7qHuJDe16VYtAX9k4buSnP6qjHNfgzFOs0fWmY7rVh1IYCgcjP"
    static let getRandomVideos = pexelsEndpoint + "/videos/search"
    
}
