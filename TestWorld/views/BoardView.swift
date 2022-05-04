//
//  BoardView.swift
//  TestWorld
//
//  Created by sher on 27/4/22.
//

import UIKit



class BoardView: UIView {
    
    
    let originX: CGFloat = 22
    let originY: CGFloat = 22
    let cellSide: CGFloat = 23
    
    var pingX: Int = 22
    var pingY: Int = 22
    var shadowping: [PingCell] = []
    var shadowKasatka: [KasatkaCell] = []
    var board = Board()
    
    override func draw(_ rect: CGRect) {
        
        randomizePing()
        randomizePKasatka()
//        board.ping.append(PingCell(col: 7, row: 7))
//        board.ping.append(PingCell(col: 4, row: 7))
//        board.kasatka.append(KasatkaCell(col: 8, row: 7))
        shadowping = board.ping
        shadowKasatka = board.kasatka
  
        drawGrid()
        drawPing()
        drawKasatka()
      
//        print(board.ping)
    
        print(shadowping.count)
        
        print(shadowKasatka.count)
//        print(Board.cols)
//        print(Board.cols % 100 * 5 / 10)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        board.MoveRight()
        removedPing()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
     
        setNeedsDisplay()
    }
    
    func removedPing() {
        for i in board.ping {
            for j in board.kasatka {
                if i.col == j.col && i.row == j.row {
                    board.ping.remove(at: 0)
                    shadowping = board.ping
                }
            }
        }
    }
  
    
    func randomizePing() {
        for _ in 0..<Int(Board.cols) / 2 {
            for _ in 0..<Int(Board.rows) / 2 {
              
                board.ping.append(PingCell(col: Int(arc4random()) % Int(Board.cols), row: Int(arc4random()) % Int(Board.rows) ))
            }
        }

    }
    
    func randomizePKasatka() {
        for _ in 0..<(Board.cols % 100 * 5) / 10 - 3 {
            for _ in 0..<(Board.cols % 100 * 5) / 10 - 3 {
              
                board.kasatka.append(KasatkaCell(col: Int(arc4random()) % Int(Board.cols), row: Int(arc4random()) % Int(Board.rows) ))
            }
        }

    }
    
    func drawPing() {
        if shadowping.isEmpty {
            return
        }
        let ping =  UIImage(named: "ping")
        
        for i in 1..<shadowping.count {
            let cell = shadowping[i]
            ping?.draw(in:  CGRect(x: originX + CGFloat(cell.col) * cellSide, y: originY + CGFloat(cell.row) * cellSide, width: cellSide, height: cellSide ))
            
        }
        
        
    }
    
    func drawKasatka() {
        
        let ping =  UIImage(named: "kasatka")
        
        for cell in shadowKasatka {
            ping?.draw(in:  CGRect(x: originX + CGFloat(cell.col) * cellSide, y: originY + CGFloat(cell.row) * cellSide, width: cellSide, height: cellSide))
            
        }
        
        
    }
    
    func drawGrid() {
        let gridPath = UIBezierPath()
        
        for i in 0...Board.rows {
            gridPath.move(to: CGPoint(x: originX, y: originY + CGFloat(i) * cellSide))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(Board.cols) * cellSide, y: originY + CGFloat(i) * cellSide))
        }
        
        for i in 0...Board.cols {
            gridPath.move(to: CGPoint(x: originX + CGFloat(i) * cellSide, y: originY))
            gridPath.addLine(to: CGPoint(x: originX + CGFloat(i) * cellSide, y: originY + CGFloat(Board.rows) * cellSide))
        }
        
        UIColor.lightGray.setStroke()
        gridPath.stroke()
    }
    
 
   

}
