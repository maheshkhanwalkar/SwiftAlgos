//
//  Traversal.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

// Perform a Depth First Search (DFS) on the given graph
func dfs<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> [K] {
    var visited = Set<K>()
    var res: [K] = []

    for elem in graph.getVertices() {
        // already visited this vertex
        if visited.contains(elem) {
            continue
        }

        // explore the graph starting from 'elem'
        explore(vertex: elem, graph: graph, visited: &visited, res: &res)
    }

    return res
}

// Perform a Breadth First Search (BFS) on the given graph
func bfs<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> [K] {
    var visited = Set<K>()
    var res: [K] = []

    for elem in graph.getVertices() {
        // already visited this vertex
        if visited.contains(elem) {
            continue
        }

        var queue = LinkedList<K>()
        queue.add(elem: elem)

        while !queue.isEmpty() {
            let curr = queue.remove()!

            if visited.contains(curr) {
                continue
            }

            visited.insert(curr)
            res.append(curr)

            queue.addAll(items: graph.outgoing(from: curr))
        }
    }

    return res
}

private func explore<K: Hashable, W: Comparable>(vertex: K, graph: Graph<K, W>,
          visited: inout Set<K>, res: inout [K])
{
    if visited.contains(vertex) {
        return
    }

    visited.insert(vertex)
    res.append(vertex)

    // continue exploring
    for elem in graph.outgoing(from: vertex) {
        explore(vertex: elem, graph: graph, visited: &visited, res: &res)
    }
}
