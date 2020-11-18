//
//  PodcastClipViewModel.swift
//  PodClips
//
//  Created by Ross Harding on 11/18/20.
//

import Foundation

struct PodcastClipViewModel {
    
    var podcastClip: PodcastClip
    
    var name: String {
        podcastClip.name
    }
}
