//
//  PodcastClip.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import Foundation

struct PodcastClip: Codable {
//    var id: String
    var name: String
//    var url: String {
//        return ""
//    }
    
    enum CodingKeys: CodingKey {
        case name
    }
}
