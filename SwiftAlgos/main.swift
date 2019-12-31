//
//  main.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/24/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

func intro() {
    let res = peasantMultiply(x: 914, y: 314)
    let equiv = 914 * 314

    print(res)
    print(equiv)
}

func recursion() {
    var mSort = [1, 10, 7, 3, 2, 8, 6, 5, 4, 9, 11, 12]
    mergeSort(input: &mSort)
    print(mSort)

    var qSort = [8, 7, 6, 2, 4, 5, 1, 10, 9, 3]
    quickSort(input: &qSort)
    print(qSort)

    var qs = [8, 5, 3, 2, 4, 1, 6, 7]
    let median = quickSelect(input: &qs, k: qs.count / 2)
    print(median)
}

intro()
recursion()
