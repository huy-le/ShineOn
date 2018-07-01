//
//  RemoveDuplicateArray.swift
//  ShineOn
//
//  Created by Huy Le on 1/7/18.
//  Copyright © 2018 Huy Le. All rights reserved.
//

import Foundation

class RemoveDuplicateInArray {
    
    func removeDuplicateInArray(input: inout [Int]) -> Int {
        var newArraySize = input.count
        var candidatePointer = 0
        var leftPointer = candidatePointer + 1
        
        while leftPointer < newArraySize {
            let candidateValue = input[candidatePointer]
            let leftValue = input[leftPointer]
            
            if candidateValue == leftValue {
                input.remove(at: leftPointer)
                newArraySize -= 1
            }
            
            candidatePointer += 1
            leftPointer = candidatePointer + 1
        }
        
        return newArraySize
    }

}
