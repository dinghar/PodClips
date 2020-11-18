//
//  CategoryTableCellViewModel.swift
//  PodClips
//
//  Created by Ross Harding on 11/18/20.
//

import UIKit

struct CategoryTableCellViewModel {
    
    let category: Category?
    
    var name: String {
        category?.name ?? ""
    }

}
