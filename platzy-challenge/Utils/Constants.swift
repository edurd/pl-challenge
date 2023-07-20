//
//  Constants.swift
//  platzy-challenge
//
//  Created by Eduardo Hoyos Loli on 17/07/23.
//

import Foundation

struct Constants {
    static let marvelEndpoint = "https://gateway.marvel.com"
    static let apikey = "9443382fb20ccfc90747788180b86388"
    static let filter = "&title=Iron man".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
    static let hashNts = "&hash=7773424760c80bf92d92328402871f2d&ts=1"
    static let auth = "?apikey=\(apikey)&hash=7773424760c80bf92d92328402871f2d&ts=1"
    
    
    static let getComics = marvelEndpoint + "/v1/public/comics\(auth)\(filter ?? "")"
    
    static let pexelsEndpoint = "https://api.pexels.com"
    static let pexelsApiKey = "2QSHwY7qHuJDe16VYtAX9k4buSnP6qjHNfgzFOs0fWmY7rVh1IYCgcjP"
    
    static let getRandomVideos = pexelsEndpoint + "/videos/search?query="
    
}
