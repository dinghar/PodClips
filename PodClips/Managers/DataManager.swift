//
//  DataManager.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import UIKit

class DataManager: NSObject {
    
    typealias UserDataResult = (Result<UserData, UserDataError>) -> ()
    
    func fetchUserData(_ completion: @escaping (UserData?) -> ()) { //_ completion: @escaping UserDataResult) {
        completion(nil)
    }

}
