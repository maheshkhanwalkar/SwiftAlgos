//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var g = Graph<Int, Int>()

g.addVertex(0)
g.addVertex(1)
g.addVertex(2)
g.addVertex(3)

let _ = g.addEdge(from: 0, to: 1)
let _ = g.addEdge(from: 0, to: 2)
let _ = g.addEdge(from: 2, to: 3)

let out = g.outgoing(from: 0)
print(out)

for vtx in out {
    print("Weight: 0 -> \(vtx): \(g.weight(from: 0, to: vtx))")
}
