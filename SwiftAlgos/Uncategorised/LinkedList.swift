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

    private var size = 0

    func isEmpty() -> Bool {
        return head == nil
    }

    mutating func add(elem: K) {
        let link = ListNode<K>(elem: elem, next: nil)
        size += 1

        if head == nil {
            head = link
            tail = link

            return
        }

        tail!.next = link
        tail = link
    }

    mutating func addFront(elem: K) {
        let link = ListNode<K>(elem: elem, next: head)

        head = link
        size += 1

        if tail == nil {
            tail = head
        }
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

        size -= 1

        if next == nil {
            head = nil
            tail = nil
        }
        else {
            head = next
        }

        return elem
    }

    func get(pos: Int) -> K? {
        if pos >= size {
            return nil
        }

        var ptr = head!
        var count = 0

        while count < pos {
            ptr = ptr.next!
            count += 1
        }

        return ptr.elem
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
