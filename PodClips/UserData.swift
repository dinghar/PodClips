//
//  UserData.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import Foundation

struct UserData: Decodable {

    enum CodingKeys: String, CodingKey {
        case user
    }

    init(from decoder: Decoder) throws {

    }

}
