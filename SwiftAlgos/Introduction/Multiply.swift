//
//  Multiply.swift
//  SwiftAlgos
//
//  Created by Mahesh Khanwalkar on 12/29/19.
//  Copyright © 2019 Mahesh Khanwalkar. All rights reserved.
//

import Foundation

func peasantMultiply(x: Int, y: Int) -> Int {
    var prod: Int = 0
    var half, double: Int

    if x < y {
        half = y
        double = x
    }
    else {
        half = x
        double = y
    }

    while half > 0 {
        if half % 2 != 0 {
            prod += double
        }

        half = half / 2
        double += double
    }

    return prod
}
