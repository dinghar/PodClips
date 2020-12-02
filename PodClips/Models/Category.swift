//
//  Category.swift
//  PodClips
//
//  Created by Ross Harding on 10/23/20.
//

import Foundation

struct Category: Codable {
    let name: String
    let timestamp: Int
    let podcastIds: [Int]?
    
    enum CodingKeys: CodingKey {
        case name, timestamp, podcastIds
    }
}
