//
//  Board.swift
//  TestWorld
//
//  Created by sher on 27/4/22.
//

import Foundation

struct Board: CustomStringConvertible {
    
     static let cols = 14
     static let rows = 22
    
    var ping: [PingCell] = []
    var kasatka: [KasatkaCell] = []
    
    mutating func MoveLeft() {
        
        for i in ping {
            for j in kasatka {
                kasatka = updateKasatka(newHead: KasatkaCell(col: j.col - 1, row: j.row))
                ping = updatePing(newHead: PingCell(col: i.col - 1, row: i.row))
            }
//            ping = updatePing(newHead: PingCell(col: i.col - 1, row: i.row))

        }
        
        

    }
    mutating func MoveRight() {
//        for i in ping {
//            for j in kasatka {
//        kasatka = updateKasatka(newHead: KasatkaCell(col: kasatka[0].col, row: kasatka[0].row - 1))
//            }
            ping = updatePing(newHead: PingCell(col: ping[0].col, row: ping[0].row - 1))
//        }
        
    }
    mutating func MoveUp() {
        for i in ping {
            ping = updatePing(newHead: PingCell(col: i.col + 1, row: i.row))
        }
      
    }
    mutating func MoveDown() {
        for i in ping {
            ping = updatePing(newHead: PingCell(col: i.col, row: i.row + 1))
        }
        
    }
    
    mutating func updatePing(newHead: PingCell) -> [PingCell] {
        var newPing: [PingCell] = []
        newPing.append(newHead)
        
        if ping[0].col > Board.cols && ping[0].row > Board.rows {
            return ping
        } else {
            let cell = ping[0]
            newPing.append(cell)
        }
               
            
       return newPing
    }
    
    mutating func updateKasatka(newHead: KasatkaCell) -> [KasatkaCell] {
        var newPing: [KasatkaCell] = []
        newPing.append(newHead)
        
          
                let cell = kasatka[0]
                newPing.append(cell)
            
       return newPing
    }
    
    func isOnPing( col: Int, row: Int ) -> Bool {
        
        for cell in ping {
            if col == cell.col && row == cell.row {
                return true
            }
        }
        return false
        
    }
    func isOnKasatka( col: Int, row: Int ) -> Bool {
        
        for cell in kasatka {
            if col == cell.col && row == cell.row {
                return true
            }
        }
        return false
        
    }
    
    
    var description: String {
        var desc = " "
        
        for i in 0..<Board.cols {
            desc += " \(i)"
            
        }
        desc += "\n"
        
        for j in 0..<Board.rows {
            desc += "\(j) "
            for i in 0..<Board.cols {
                
                if isOnPing(col: j, row: i) {
                    desc += "x "
                } else {
                    desc += ". "
                }
                
                if isOnKasatka(col: j, row: i) {
                    desc += "y "
                } else {
                    desc += ". "
                }
                
            }
            desc += "\n"
        }
        
        return desc
        
    }
    
    
}
