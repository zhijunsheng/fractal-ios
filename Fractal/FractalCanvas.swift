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

    override func draw(_ rect: CGRect) {
        boxyFractal(x: rect.width/2, y: rect.height/2, size: 128, order: fractalOrder)
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
