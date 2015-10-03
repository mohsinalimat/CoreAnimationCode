//
//  ViewController.swift
//  EasingFunction
//
//  Created by lzw on 15/10/4.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var colorLayer = CALayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.colorLayer.frame = CGRectMake(0, 0, 100, 100)
        self.colorLayer.position = CGPointMake(200, 200)
        self.colorLayer.backgroundColor  = UIColor.redColor().CGColor
        self.view.layer.addSublayer(self.colorLayer)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        self.colorLayer.position = touches.first!.locationInView(self.view)
        CATransaction.commit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

