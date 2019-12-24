//
//  Vertex.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

// Implementation of a Graph vertex
//
// This struct extends the basic vertex concept to implement a full
// key-value mapping
struct Vertex<K: Hashable, V> {
    var key: K
    var value: V
}

// The equality and hashability is based on keys only, that is, the key
// determines uniqueness -- there can't 2+ vertices with the same key
extension Vertex: Hashable {
    static func == (lhs: Vertex<K, V>, rhs: Vertex<K, V>) -> Bool {
        return lhs.key == rhs.key
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}
