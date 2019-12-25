//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var graph = Graph<Int, Int>()

for i in 0..<7 {
    graph.addVertex(i)
}

let _ = graph.addEdge(from: 0, to: 1)
let _ = graph.addEdge(from: 1, to: 0)
let _ = graph.addEdge(from: 1, to: 2)
let _ = graph.addEdge(from: 2, to: 1)
let _ = graph.addEdge(from: 2, to: 3)
let _ = graph.addEdge(from: 3, to: 2)
let _ = graph.addEdge(from: 2, to: 4)
let _ = graph.addEdge(from: 4, to: 2)
let _ = graph.addEdge(from: 2, to: 5)
let _ = graph.addEdge(from: 5, to: 2)
let _ = graph.addEdge(from: 5, to: 4)
let _ = graph.addEdge(from: 4, to: 5)
let _ = graph.addEdge(from: 4, to: 6)
let _ = graph.addEdge(from: 6, to: 4)

let dfsRes = dfs(graph: graph)
let bfsRes = bfs(graph: graph)

print(dfsRes)
print(bfsRes)

var list = LinkedList<Int>()

for i in 0..<10 {
    list.add(elem: i)
}

print(list.get(pos: 5)!)
print(list.get(pos: 8)!)
