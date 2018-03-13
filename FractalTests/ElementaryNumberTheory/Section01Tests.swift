//
//  Section01Tests.swift
//  FractalTests
//
//  Created by Donald Sheng on 2018-03-12.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import XCTest

class Section01Tests: XCTestCase {
    
    /*
     * Is it possible to have 100 coins, made up of c pennies, d dimes, and q quarters, be worth
     * exactly $5.00?
     */
    func testCoins() {
        var foundSolution = false
        for c in 1...100 {
            for d in 1...100 {
                for q in 1...100 {
                    if c + d + q == 100 && c + 10 * d + 25 * q == 500 {
                        print("solution: c = \(c), d = \(d), q = \(q)")
                        foundSolution = true
                        break
                    }
                }
            }
        }
        if !foundSolution {
            print("no solution")
        }
        XCTAssertFalse(foundSolution)
    }
    
    func testCoins2() {
        XCTAssertFalse(possible(target: 500))
        XCTAssertTrue(possible(target: 499))
    }
    
    private func possible(target: Int) -> Bool {
        var foundSolution = false
        for c in 1...100 {
            for d in 1...100 {
                for q in 1...100 {
                    if c + d + q == 100 && c + 10 * d + 25 * q == target {
                        print("solution: c = \(c), d = \(d), q = \(q)")
                        foundSolution = true
                        break
                    }
                }
            }
        }
        return foundSolution
    }
    
}
