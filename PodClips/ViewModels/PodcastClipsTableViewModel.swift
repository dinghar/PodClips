//
//  PodcastClipsTableViewModel.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import Foundation

struct PodcastClipsTableViewModel {
    
    var category: Category
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfRows: Int {
        podcastClips.count
    }
    
    var podcastClips: [PodcastClip] {
        category.podcastClips
    }
    
    func podcastClip(at index: Int) -> PodcastClip? {
        guard index < podcastClips.count else {
            return nil
        }
        return podcastClips[index]
    }
}
