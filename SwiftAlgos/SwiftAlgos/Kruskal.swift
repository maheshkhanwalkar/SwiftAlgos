//
//  Kruskal.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

func kruskal<K: Hashable, W>(graph: Graph<K, W>) -> Graph<K, W>? {
    let list = graph.getVertices()
    var mst = Graph<K, W>()

    var map: [K: Int] = [:]
    var count = 0

    // MST contains all the vertices in the graph
    for elem in list {
        mst.addVertex(elem)
        map[elem] = count

        count += 1
    }

    var ds = DisjointSet(size: list.count)


    return nil
}
