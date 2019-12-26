//
//  Stack.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/25/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

struct Stack<K> {
    private var list = LinkedList<K>()

    mutating func push(elem: K) {
        list.addFront(elem: elem)
    }

    mutating func pop() -> K? {
        return list.remove()
    }

    func peek() -> K? {
        return list.get(pos: 0)
    }
}
