//
//  Graph.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

struct Graph<K: Hashable, W> {
    private var map: [K: Int] = [:]
    private var count = 0

    // Adjacency list
    private var adj: [Int: [(K, W?)]] = [:]

    // Add a vertex to the graph
    mutating func addVertex(_ key: K) {
        map[key] = count
        count += 1
    }

    // Add an edge to the graph
    mutating func addEdge(from: K, to: K, weight: W? = nil) -> Bool {
        guard let src = map[from] else {
            return false
        }

        var list = adj[src] ?? []
        list.append((to, weight))

        adj[src] = list
        return true
    }

    func hasEdge(from: K, to: K) -> Bool {
        guard let src = map[from] else {
            return false
        }

        guard let list = adj[src] else {
            return false
        }

        // try to find a matching vertex
        for pair in list {
            let vtx = pair.0

            if(vtx == to) {
                return true
            }
        }

        return false
    }
}
