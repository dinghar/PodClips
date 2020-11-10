//
//  CategoriesTableViewModel.swift
//  PodClips
//
//  Created by Ross Harding on 10/23/20.
//

import Foundation

struct CategoriesTableViewModel {
    
    // MARK: - Properties

    let userData: UserData?
    
    var categories: [Category] {
        [Category]()
        // parse userData
    }
    
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
