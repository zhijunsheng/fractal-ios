//
//  ViewController.swift
//  Fractal
//
//  Created by Donald Sheng on 2018-03-12.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fractalCanvasView: FractalCanvas!
    @IBOutlet weak var orderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func minusButtonTapped(_ sender: UIButton) {
        if fractalCanvasView.fractalOrder > 0 {
            fractalCanvasView.fractalOrder -= 1
            orderLabel.text = "Order: \(fractalCanvasView.fractalOrder)"
            fractalCanvasView.setNeedsDisplay()
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        if fractalCanvasView.fractalOrder < 9 {
            fractalCanvasView.fractalOrder += 1
            orderLabel.text = "Order: \(fractalCanvasView.fractalOrder)"
            fractalCanvasView.setNeedsDisplay()
        }
    }
}

