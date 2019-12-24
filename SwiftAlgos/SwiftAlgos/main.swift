//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

var pq = PriorityQueue<Int>()

for i in (0..<10).reversed() {
    pq.add(elem: i)
}

pq.add(elem: 4)
pq.add(elem: 5)
pq.add(elem: 6)

while !pq.isEmpty() {
    print(pq.remove()!)
}
