//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var ds = DisjointSet(size: 8)

let _ = ds.union(0, 1)
let _ = ds.union(2, 3)
let _ = ds.union(4, 5)
let _ = ds.union(6, 7)
let _ = ds.union(0, 3)
let _ = ds.union(4, 1)

print(ds.sameSet(2, 5))
print(ds.sameSet(6, 3))
