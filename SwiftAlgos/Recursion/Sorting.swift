//
//  Sorting.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/31/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

func mergeSort<T: Comparable>(input: inout [T]) {
    mergeSort(left: 0, right: input.count, input: &input)
}

private func mergeSort<T: Comparable>(left: Int, right: Int, input: inout [T]) {
    if right == left + 1 {
        return
    }

    let mid = left + (right - left) / 2

    // sort the halves
    mergeSort(left: left, right: mid, input: &input)
    mergeSort(left: mid, right: right, input: &input)

    // merge them together
    merge(left: left, mid: mid, right: right, input: &input)
}

private func merge<T: Comparable>(left: Int, mid: Int, right: Int, input: inout [T]) {
    var copy: [T] = []
    let amt = right - left

    var i = left
    var j = mid

    for _ in 0..<amt {
        if i < mid && j < right {
            if input[i] > input[j] {
                copy.append(input[j])
                j += 1
            }
            else {
                copy.append(input[i])
                i += 1
            }
        }
        else if i < mid {
            copy.append(input[i])
            i += 1
        }
        else {
            copy.append(input[j])
            j += 1
        }
    }

    for k in 0..<amt {
        input[left + k] = copy[k]
    }
}
