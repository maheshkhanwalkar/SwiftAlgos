//
//  DisjointSet.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

struct DisjointSet {
    private var elems: [Int] = []
    private var weights: [Int:Int] = [:]

    var size: Int

    init(size: Int) {
        self.size = size

        // each member points to itself with weight 1
        for i in 0..<size {
            self.elems.append(i)
            self.weights[i] = 1
        }
    }

    mutating func sameSet(_ first: Int, _ second: Int) -> Bool {
        let fid = id(first)
        let sid = id(second)

        return fid == sid && fid != nil
    }

    mutating func union(_ first: Int, _ second: Int) -> Bool {
        guard let fid = id(first) else {
            return false
        }

        guard let sid = id(second) else {
            return false
        }

        // safe to force unwrap, since the existence of 'fid' and 'sid' imply
        // that they exist within the weights map
        if weights[fid]! > weights[sid]! {
            elems[sid] = fid
            weights[fid] = weights[fid]! + weights[sid]!
        }
        else {
            elems[fid] = sid
            weights[sid] = weights[sid]! + weights[fid]!
        }

        return true
    }
}

extension DisjointSet {
    private mutating func id(_ pos: Int) -> Int? {
        // out of bounds
        if pos >= elems.count {
            return nil
        }

        var ip = pos

        // compress path while traversing
        while(ip != elems[ip]) {
            let flat = elems[elems[ip]]
            elems[ip] = flat

            ip = flat
        }

        return ip
    }
}
