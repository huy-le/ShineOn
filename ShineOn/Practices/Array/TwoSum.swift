//
//  TwoSum.swift
//  ShineOn
//
//  Created by Huy Le on 1/7/18.
//  Copyright © 2018 Huy Le. All rights reserved.
//

import Foundation

class TwoSum {
    
    func twoSum(_ input: [Int], _ sum: Int) -> [Int] {
        // Proprocessing
        var dict: [Int: Int] = [:]
        input.enumerated().forEach { args in
            let (index, key) = args
            dict[key] = index
        }
        // Loop
        for i in 0..<input.count {
            let key = input[i]
            if let index = dict[key] {
                return [i, index]
            }
        }
        return []
    }


}
