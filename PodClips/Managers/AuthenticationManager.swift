//
//  AuthenticationManager.swift
//  PodClips
//
//  Created by Ross Harding on 11/20/20.
//

import UIKit

import FirebaseAuth

class AuthenticationManager: NSObject {
    
    func getUserId() -> String? {
        return Auth.auth().currentUser?.uid
    }

}
