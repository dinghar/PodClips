//
//  Date+extension.swift
//  PodClips
//
//  Created by Ross Harding on 12/2/20.
//

import Foundation

extension Date {
    
    func toTimestamp() -> Int {
        return lround(self.timeIntervalSince1970)
    }
    
}
