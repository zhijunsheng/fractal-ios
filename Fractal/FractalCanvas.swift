//
//  FractalCanvas.swift
//  Fractal
//
//  Created by Donald Sheng on 2018-03-12.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class FractalCanvas: UIView {
    
    var fractalOrder = 0
    let cantorSetDeltaY: CGFloat = 10

    override func draw(_ rect: CGRect) {
        cantorSet(fromX: rect.minX + 10, fromY: rect.minY + 20, toX: rect.maxX - 10, toY: rect.minY + 20, order: fractalOrder)
        boxyFractal(x: rect.width/2, y: rect.height/2 + 100, size: 128, order: fractalOrder)
    }
    
    private func cantorSet(fromX: CGFloat, fromY: CGFloat, toX: CGFloat, toY: CGFloat, order: Int) {
        if order >= 0 {
            drawLine(fromX: fromX, fromY: fromY, toX: toX, toY: toY)
            cantorSet(fromX: fromX, fromY: fromY + cantorSetDeltaY, toX: fromX + (toX - fromX)/3, toY: fromY + cantorSetDeltaY, order: order - 1)
            cantorSet(fromX: fromX + 2*(toX - fromX)/3, fromY: fromY + cantorSetDeltaY, toX: toX, toY: fromY + cantorSetDeltaY, order: order - 1)
        }
    }

    private func boxyFractal(x: CGFloat, y: CGFloat, size: CGFloat, order: Int) {
        if order >= 0 {
            boxyFractal(x: x - size/2, y: y - size/2, size: size/2, order: order - 1)
            boxyFractal(x: x + size/2, y: y + size/2, size: size/2, order: order - 1)
            drawSquare(centerX: x, centerY: y, size: size)
            boxyFractal(x: x + size/2, y: y - size/2, size: size/2, order: order - 1)
            boxyFractal(x: x - size/2, y: y + size/2, size: size/2, order: order - 1)
        }
    }
    
    private func drawLine(fromX: CGFloat, fromY: CGFloat, toX: CGFloat, toY: CGFloat) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: fromX, y: fromY))
        path.addLine(to: CGPoint(x: toX, y: toY))
        UIColor.black.setStroke()
        path.lineWidth = 6
        path.stroke()
    }
    
    private func drawSquare(centerX: CGFloat, centerY: CGFloat, size: CGFloat) {
        let rect = CGRect(x: centerX - size/2, y: centerY - size/2, width: size, height: size)
        let path = UIBezierPath(rect: rect)
        UIColor.red.setStroke()
        path.lineWidth = 4
        path.stroke()
        UIColor.blue.setFill()
        path.fill()
    }
}
