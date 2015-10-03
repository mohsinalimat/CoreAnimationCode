//
//  ViewController.swift
//  TimingWithCAKeyframeAnimation
//
//  Created by lzw on 15/10/4.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    var colorLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorLayer = CALayer()
        colorLayer.frame = CGRectMake(50, 50, 100, 100)
        colorLayer.backgroundColor = UIColor.blueColor().CGColor
        layerView.layer.addSublayer(colorLayer)
    }

    @IBAction func changeColor(sender: AnyObject) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "backgroundColor"
        animation.duration = 2
        let values = [UIColor.blueColor().CGColor, UIColor.redColor().CGColor,UIColor.greenColor().CGColor, UIColor.blueColor().CGColor]
        animation.values = values
        let fn = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.timingFunctions = [fn, fn, fn]
        self.colorLayer.addAnimation(animation, forKey: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

