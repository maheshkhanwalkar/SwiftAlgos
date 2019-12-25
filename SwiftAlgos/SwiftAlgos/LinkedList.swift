//
//  LinkedList.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

struct LinkedList<K> {
    // linked list pointers
    private var head: ListNode<K>? = nil
    private var tail: ListNode<K>? = nil

    func isEmpty() -> Bool {
        return head == nil
    }

    mutating func add(elem: K) {
        let link = ListNode<K>(elem: elem, next: nil)

        if head == nil {
            head = link
            tail = link

            return
        }

        tail!.next = link
        tail = link
    }

    mutating func addAll(items: [K]) {
        for item in items {
            add(elem: item)
        }
    }

    mutating func remove() -> K? {
        // nothing to remove
        if head == nil {
            return nil
        }

        let next = head!.next
        let elem = head!.elem

        if next == nil {
            head = nil
            tail = nil
        }
        else {
            head = next
        }

        return elem
    }
}

private class ListNode<K> {
    var elem: K
    var next: ListNode<K>?

    init(elem: K, next: ListNode<K>?) {
        self.elem = elem
        self.next = next
    }
}
