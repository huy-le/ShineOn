//
//  ReverseString.swift
//  ShineOnTests
//
//  Created by Huy Le on 1/7/18.
//  Copyright © 2018 Huy Le. All rights reserved.
//

import XCTest
@testable import ShineOn

final class ReverseStringTests: XCTestCase {
    
    func testReverse() {
        let input = "hello"
        let candidate = ReverseString().reverseString(input: input)
        XCTAssertEqual(candidate, "olleh")        
    }
}
