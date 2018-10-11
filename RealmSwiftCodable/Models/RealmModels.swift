//
//  RealmModels.swift
//  RealmSwiftCodable
//
//  Created by Adib Contractor on 10/10/18.
//  Copyright © 2018 Adib Contractor. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers class StoredUser: Object, Decodable {
    dynamic var id: String = ""
    dynamic var userName: String = ""
    let playlists = RealmSwift.List<StoredPlaylist>()
    
    enum CodingKeys: String, CodingKey {
        case id
        case userName
        case playlists
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        userName = try container.decode(String.self, forKey: .userName)
        
        let playlistList = try container.decode([StoredPlaylist].self, forKey: .playlists)
        playlists.append(objectsIn: playlistList)
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
}

@objcMembers class StoredPlaylist: Object, Decodable {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var desc: String? = nil
    dynamic var duration: Int = 0
    let tracks = RealmSwift.List<StoredTrack>()
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case desc
        case duration
        case tracks
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        desc = try? container.decode(String.self, forKey: .desc)
        duration = try container.decode(Int.self, forKey: .duration)
        
        let trackList = try container.decode([StoredTrack].self, forKey: .tracks)
        tracks.append(objectsIn: trackList)
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
}

@objcMembers class StoredTrack: Object, Decodable {
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var artist: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case artist
    }
    
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        artist = try container.decode(String.self, forKey: .artist)
        
        super.init()
    }
    
    override static func primaryKey() -> String?
    {
        return "id"
    }
    
    required init()
    {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema)
    {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema)
    {
        super.init(realm: realm, schema: schema)
    }
}
