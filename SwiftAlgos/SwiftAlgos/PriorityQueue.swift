//
//  PriorityQueue.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

struct PriorityQueue<T: Comparable> {
    private var queue: [T?] = [nil]

    mutating func add(elem: T) {
        queue.append(elem)
        swim(start: queue.count - 1)
    }

    func peek() -> T? {
        if queue.count < 2 {
            return nil
        }

        return queue[1]
    }
}

extension PriorityQueue {
    // swim up the heap -- until the element originally at 'start' is at the correct
    // position to satisfy the min-heap property
    private mutating func swim(start: Int) {
        var pos = start

        if pos >= queue.count {
            return
        }

        while pos != 1 {
            let parent = pos / 2

            if queue[pos]! < queue[parent]! {
                queue.swapAt(pos, parent)
                pos = parent
            }
            else {
                break
            }
        }
    }
}
