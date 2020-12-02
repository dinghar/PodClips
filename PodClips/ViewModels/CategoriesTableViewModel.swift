//
//  CategoriesTableViewModel.swift
//  PodClips
//
//  Created by Ross Harding on 10/23/20.
//

import Foundation

struct CategoriesTableViewModel {
    
    // MARK: - Properties

    let categories: [Category]
    
//    var categories: [Category] {
//        let category1 = Category(id: "1", name: "Economics", podcastClips: [
//            PodcastClip(id: "1", name: "Introduction to Econ"),
//            PodcastClip(id: "2", name: "Intermediate Econ"),
//            PodcastClip(id: "3", name: "A Biography of John Maynard Keynes"),
//        ])
//        let category2 = Category(id: "2", name: "Swift", podcastClips: [
//            PodcastClip(id: "1", name: "Introduction to Swift"),
//            PodcastClip(id: "2", name: "Intermediate Swift"),
//            PodcastClip(id: "3", name: "A Biography of Steve Jobs"),
//        ])
//        let category3 = Category(id: "3", name: "Web Development", podcastClips: [
//            PodcastClip(id: "1", name: "Introduction to Web Development"),
//            PodcastClip(id: "2", name: "Intermediate Web Dev"),
//            PodcastClip(id: "3", name: "A Biography of Tim Berners-Lee"),
//        ])
//        let category4 = Category(id: "4", name: "D2C", podcastClips: [
//            PodcastClip(id: "1", name: "Introduction to D2C"),
//            PodcastClip(id: "2", name: "Intermediate D2C"),
//            PodcastClip(id: "3", name: "A History of Warby Parker"),
//        ])
//        return [category1, category2, category3, category4]
//        return []
//    }
    
//    var categories: [Category] {
//        [Category]()
//        // parse userData
//    }
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfRows: Int {
        categories.count
    }
    
    func category(at index: Int) -> Category? {
        guard index < categories.count else {
            return nil
        }
        return categories[index]
    }
}
