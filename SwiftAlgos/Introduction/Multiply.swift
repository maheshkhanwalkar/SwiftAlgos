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
    var down, up: Int

    if x < y {
        down = y
        up = x
    }
    else {
        down = x
        up = y
    }

    while down > 0 {
        // odd parity check
        if down % 2 != 0 {
            prod += up
        }

        down = down / 2
        up += up
    }

    return prod
}
