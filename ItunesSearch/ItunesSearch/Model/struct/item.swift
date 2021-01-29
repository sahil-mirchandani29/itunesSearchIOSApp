//
//  item.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import Foundation

struct item: Codable{
    let id: Int
    let name: String
    let kind: String
    let arkwork: String
    let URL: String
    let genre: String
    
    private struct APIItemName{
        static let kind = "kind"
        static let id = "trackId"
        static let name = "trackName"
        static let artwork = "artworkUrl60"
        static let URL = "trackViewUrl"
        static let genre = "primaryGenreName"
    }
    init?(dictionary: [String: Any]) {
        id = dictionary[APIItemName.id] as! Int
        kind = dictionary[APIItemName.kind] as! String
        name = dictionary[APIItemName.name] as! String
        arkwork = dictionary[APIItemName.artwork] as! String
        URL = dictionary[APIItemName.URL] as! String
        genre = dictionary[APIItemName.genre] as! String
    }
    
}

