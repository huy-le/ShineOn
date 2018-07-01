//
//  ReverseString.swift
//  ShineOn
//
//  Created by Huy Le on 1/7/18.
//  Copyright © 2018 Huy Le. All rights reserved.
//

import Foundation

class ReverseString {
    
    func reverseString(input: String) -> String {
        var output: String = ""
        
        for i in stride(from: input.count - 1, through: 0, by: -1) {
            output.append(input[String.Index(encodedOffset: i)])
        }
        return output
    }
    
    func efficientReverseString(input: inout String) -> String {
        var input = Array(input)
        var leftPointer = 0
        var rightPointer = input.count - 1
        
        while leftPointer < rightPointer {
            input.swapAt(leftPointer, rightPointer)
            leftPointer += 1
            rightPointer -= 1
        }
        
        return String(input)

    }
    
}

extension String {
    func swap(characterAtIndexA: String.Index, characterAtIndexB: String.Index) {
        
    }
}

