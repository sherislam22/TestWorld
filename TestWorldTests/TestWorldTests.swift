//
//  TestWorldTests.swift
//  TestWorldTests
//
//  Created by sher on 27/4/22.
//

import XCTest
@testable import TestWorld
class TestWorldTests: XCTestCase {

    func testPrintingBoard() {
        var board = Board()
        
        board.ping.append(PingCell(col:2, row: 1))
        board.ping.append(PingCell(col: 3, row: 1))
        board.ping.append(PingCell(col: 3, row: 2))
        board.kasatka.append(KasatkaCell(col: 3, row: 4))
        print(board)
    }

}
