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
}

intro()
recursion()
