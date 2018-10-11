//
//  BasicModels.swift
//  RealmSwiftCodable
//
//  Created by Adib Contractor on 10/9/18.
//  Copyright © 2018 Adib Contractor. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String
    var userName: String
    var playlists: [Playlist]
}

struct Playlist: Codable {
    var id: String
    var name: String
    var desc: String?
    var duration: Int
    var tracks: [Track]
}

struct Track: Codable {
    var id: String
    var name: String
    var artist: String
}
