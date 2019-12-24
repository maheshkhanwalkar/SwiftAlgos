//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var graph = Graph<Int, Int>()

for i in 0..<4 {
    graph.addVertex(i)
}

let _ = graph.addEdge(from: 0, to: 1, weight: 6)
let _ = graph.addEdge(from: 1, to: 0, weight: 6)
let _ = graph.addEdge(from: 0, to: 2, weight: 4)
let _ = graph.addEdge(from: 2, to: 0, weight: 4)
let _ = graph.addEdge(from: 2, to: 3, weight: 2)
let _ = graph.addEdge(from: 3, to: 2, weight: 2)
let _ = graph.addEdge(from: 1, to: 3, weight: 14)
let _ = graph.addEdge(from: 3, to: 1, weight: 14)

let mst = kruskal(graph: graph)
var sum = 0

for elem in mst.getVertices() {
    for next in mst.outgoing(from: elem) {
        sum += mst.weight(from: elem, to: next)!
    }
}

print(sum / 2)
