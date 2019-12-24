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

    // Check whether there is an edge: from -> to
    func hasEdge(from: K, to: K) -> Bool {
        return getEdge(from, to) != nil
    }

    // Get the weight of the edge: from -> to
    func weight(from: K, to: K) -> W? {
        guard let edge = getEdge(from, to) else {
            return nil
        }

        return edge.1
    }

    // Get a list of all outgoing vertices
    func outgoing(from: K) -> [K] {
        guard let src = map[from] else {
            return []
        }

        guard let list = adj[src] else {
            return []
        }

        var res: [K] = []

        for pair in list {
            res.append(pair.0)
        }

        return res
    }
}

extension Graph {

    // Get the underlying edge tuple
    private func getEdge(_ from: K, _ to: K) -> (K, W?)? {
        guard let src = map[from] else {
            return nil
        }

        guard let list = adj[src] else {
            return nil
        }

        // try to find a matching vertex
        for pair in list {
            let vtx = pair.0

            if(vtx == to) {
                return pair
            }
        }

        return nil
    }
}
