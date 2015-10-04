//
//  ViewController.swift
//  BouncingBall
//
//  Created by lzw on 15/10/4.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var ballView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ballImage = UIImage(named: "Ball")
        ballView = UIImageView(image: ballImage)
        containerView.addSubview(ballView)
        animate1()
    }
    
    func animate() {
        ballView.center = CGPointMake(150, 32)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.delegate = self
        animation.values = [
            NSValue(CGPoint:CGPointMake(150, 32)),
            NSValue(CGPoint:CGPointMake(150, 268)),
            NSValue(CGPoint:CGPointMake(150, 140)),
            NSValue(CGPoint:CGPointMake(150, 268)),
            NSValue(CGPoint:CGPointMake(150, 220)),
            NSValue(CGPoint:CGPointMake(150, 268)),
            NSValue(CGPoint:CGPointMake(150, 250)),
            NSValue(CGPoint:CGPointMake(150, 268))];
        animation.timingFunctions = [
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn),
        ]
        animation.keyTimes = [0.0, 0.3, 0.5, 0.7, 0.8, 0.9, 0.95, 1.0]
        ballView.layer.position = CGPointMake(150, 268)
        ballView.layer.addAnimation(animation, forKey: nil)
    }
    
    func bounceEaseOut(t: CGFloat) -> CGFloat {
        if (t < 4/11.0) {
            return (121 * t * t) / 16.0
        } else if (t < 8/11.0) {
            return (363/40.0 * t * t) - (99/10.0 * t) + 17/5.0
        } else if (t < 9/10.0) {
            return (4356/361.0 * t * t) - (35442/1805 * t) + 16061/1805.0
        } else {
            return (54/5.0 * t * t) - (513/25.0 * t) + 268 / 25.0
        }
    }
    
    func animate1() {
        ballView.center = CGPointMake(150, 32)
        
        let fromValue  = CGPointMake(150, 32)
        let toValue  = CGPointMake(150, 268)
        let duration: CFTimeInterval = 1
        let numberFrames = Int(duration * 60)
        var frames = [NSValue]()
        for i in 1...numberFrames {
            let time = CGFloat(1.0 / Float(numberFrames) * Float(i))
            let cgTime = bounceEaseOut(time)
            let point = interpolateFromValue(fromValue, toValue: toValue, time: cgTime)
            frames.append(NSValue(CGPoint: point))
        }
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 1.0
        animation.delegate = self
        animation.values = frames
        
        ballView.layer.position = CGPointMake(150, 268)
        ballView.layer.addAnimation(animation, forKey: nil)
    }
    
    func interpolate(from: CGFloat, to: CGFloat, time: CGFloat) -> CGFloat {
        return (to - from) * time + from
    }
    
    func interpolateFromValue(fromValue: CGPoint, toValue: CGPoint, time: CGFloat) -> CGPoint {
        let result = CGPointMake(interpolate(fromValue.x, to: toValue.x, time: time), interpolate(fromValue.y, to: toValue.y, time: time))
        return result
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animate1()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

