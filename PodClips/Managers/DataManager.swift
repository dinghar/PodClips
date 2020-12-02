//
//  DataManager.swift
//  PodClips
//
//  Created by Ross Harding on 11/10/20.
//

import UIKit
import FirebaseDatabase
import CodableFirebase

class DataManager: NSObject {
    
    func fetchUserCategories(_ completion: @escaping ([Category]) -> ()) {
        guard let uid = AuthenticationManager().getUserId() else {
            completion([Category]())
            return
        }
        Database.database().reference(withPath: "categories/\(uid)").queryOrdered(byChild: "timestamp").observeSingleEvent(of: .value) { (snapshot) in
            guard let value = snapshot.value as? [String: Any] else { return }
            print(value.values)
            do {
                let categories = try FirebaseDecoder().decode([Category].self, from: Array(value.values))
                completion(categories)
            } catch {
                completion([Category]())
            }
        }
    }
    
    func addCategory(_ name: String, _ completion: @escaping ([Category]) -> ()) {
        guard let uid = AuthenticationManager().getUserId() else {
            return
        }
        let ref = Database.database().reference(withPath: "categories/\(uid)").childByAutoId()
        let values: [String: Any] = [
            "name": name,
            "timestamp": Date().toTimestamp()
        ]
        ref.setValue(values) { (err, _) in
            self.fetchUserCategories { (categories) in
                completion(categories)
            }
        }
    }

}
