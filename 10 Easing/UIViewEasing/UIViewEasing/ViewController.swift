//
//  ViewController.swift
//  UIViewEasing
//
//  Created by lzw on 15/10/4.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var colorView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        colorView.bounds = CGRectMake(0, 0, 100, 100)
        colorView.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height / 2)
        colorView.backgroundColor = UIColor.redColor()
        view.addSubview(colorView)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.colorView.center = touches.first!.locationInView(self.view)
        }, completion:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

