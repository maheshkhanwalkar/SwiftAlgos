//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var ds = DisjointSet(size: 5)

let _ = ds.union(0, 1)
let _ = ds.union(1, 2)
let _ = ds.union(2, 3)

print(ds.sameSet(0, 3))
print(ds.sameSet(4, 0))
