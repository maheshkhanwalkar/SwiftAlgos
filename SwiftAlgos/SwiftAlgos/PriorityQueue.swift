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

    mutating func remove() -> T? {
        // no elements
        if queue.count == 1 {
            return nil
        }

        // one element
        if queue.count == 2 {
            return queue.remove(at: 1)
        }

        let min = queue[1]

        // update the heap
        let leaf = queue.removeLast()
        queue[1] = leaf
        sink()

        return min
    }

    func isEmpty() -> Bool {
        return queue.count == 1
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

    // sink down the heap -- until the element originally at the root is at the correct
    // position to satisfy the min-heap property
    private mutating func sink() {
        var pos = 1

        while pos < queue.count {
            let left = pos * 2
            let right = pos * 2 + 1

            // no more children -- sink complete
            if left >= queue.count {
                break
            }

            // only the left child is valid
            if right >= queue.count {
                if queue[pos]! > queue[left]! {
                    queue.swapAt(pos, left)
                    pos = left
                }
                else {
                    break
                }
            }
            else {
                let best = min(left, right)

                queue.swapAt(pos, best)
                pos = best
            }
        }
    }

    private func min(_ left: Int, _ right: Int) -> Int {
        if queue[left]! < queue[right]! {
            return left
        }
        else {
            return right
        }
    }
}
