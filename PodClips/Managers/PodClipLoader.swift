//
//  PodClipLoader.swift
//  PodClips
//
//  Created by Ross Harding on 11/20/20.
//

import UIKit
import FirebaseStorage

class PodClipLoader: NSObject {
    
    let storage = Storage.storage()
    var storageRef: StorageReference?
    
    override init() {
        super.init()
        
        storageRef = storage.reference()
    }
    
    func fetchClip(_ clipId: String, _ completion: @escaping (Data?, Error?) -> ()) {
        guard let userId = AuthenticationManager().getUserId() else {
            return
        }
        let clipRef = storageRef?.child("\(userId)/\(clipId)")
        clipRef?.getData(maxSize: 1024 * 1024, completion: { (data, err) in
            completion(data, err)
        })
    }

}
