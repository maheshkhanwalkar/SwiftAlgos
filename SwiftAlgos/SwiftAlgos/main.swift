//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var graph = Graph<Int, Int>()

for i in 0..<5 {
    graph.addVertex(i)
}

let _ = graph.addEdge(from: 0, to: 1)
let _ = graph.addEdge(from: 0, to: 2)
let _ = graph.addEdge(from: 1, to: 2)
let _ = graph.addEdge(from: 2, to: 3)
let _ = graph.addEdge(from: 1, to: 3)
let _ = graph.addEdge(from: 2, to: 4)
let _ = graph.addEdge(from: 3, to: 4)

let res = toposort(graph: graph)
print(res)
