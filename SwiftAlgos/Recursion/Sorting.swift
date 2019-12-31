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

func quickSort<T: Comparable>(input: inout [T]) {
    return quickSort(left: 0, right: input.count, input: &input)
}

private func quickSort<T: Comparable>(left: Int, right: Int, input: inout [T]) {
    if left == right {
        return
    }

    // partition the array
    let ptr = partition(left: left, right: right, input: &input)

    // sort the two halves
    quickSort(left: left, right: ptr, input: &input)
    quickSort(left: ptr + 1, right: right, input: &input)
}

private func partition<T: Comparable>(left: Int, right: Int, input: inout [T]) -> Int {
    let mid = left + (right - left) / 2
    input.swapAt(right - 1, mid)

    var ptr = left

    for i in left..<right - 1 {
        if input[i] < input[right - 1] {
            input.swapAt(ptr, i)
            ptr += 1
        }
    }

    input.swapAt(right - 1, ptr)
    return ptr
}

func quickSelect<T: Comparable>(input: inout [T], k: Int) -> T {
    return quickSelect(left: 0, right: input.count, input: &input, k: k)
}

private func quickSelect<T: Comparable>(left: Int, right: Int, input: inout [T], k: Int) -> T {
    if right == left + 1 {
        return input[left]
    }

    let pos = partition(left: left, right: right, input: &input)

    if pos == k {
        return input[pos]
    }
    else if pos > k {
        return quickSelect(left: left, right: pos, input: &input, k: k)
    }
    else {
        return quickSelect(left: pos + 1, right: right, input: &input, k: k)
    }
}
