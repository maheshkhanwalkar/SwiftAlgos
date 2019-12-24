//
//  Kruskal.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

func kruskal<K: Hashable, W: Comparable>(graph: Graph<K, W>) -> Graph<K, W> {
    let list = graph.getVertices()
    var mst = Graph<K, W>()

    var ds = DisjointSet(size: list.count)
    var pq = PriorityQueue<Edge<K, W>>()

    var map: [K: Int] = [:]
    var count = 0

    // Initialise result graph and priority queue
    for elem in list {
        mst.addVertex(elem)

        let edges = graph.outgoing(from: elem).map {
            Edge<K, W>(from: elem, to: $0, weight: graph.weight(from: elem, to: $0)!)
        }

        pq.add(items: edges)

        map[elem] = count
        count += 1
    }

    while !pq.isEmpty() {
        let best = pq.remove()!

        let fip = map[best.from]!
        let tip = map[best.to]!

        // already in the same component -- skip this edge
        if ds.sameSet(fip, tip) {
            continue
        }

        // add best edge (undirected) to MST
        let _ = mst.addEdge(from: best.from, to: best.to, weight: best.weight)
        let _ = mst.addEdge(from: best.to, to: best.from, weight: best.weight)

        // update disjoint set
        let _ = ds.union(fip, tip)
    }

    return mst
}

private struct Edge<K: Hashable, W: Comparable>: Comparable {
    var from, to: K
    var weight: W

    init(from: K, to: K, weight: W) {
        self.from = from
        self.to = to
        self.weight = weight
    }

    static func < (lhs: Edge<K, W>, rhs: Edge<K, W>) -> Bool {
        return lhs.weight < rhs.weight
    }
}
