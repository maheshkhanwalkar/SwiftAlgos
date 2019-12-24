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

let _ = g.addEdge(from: 0, to: 1)

let bad = g.addEdge(from: 2, to: 3)
print(bad)

let good = g.hasEdge(from: 0, to: 1)
print(good)
