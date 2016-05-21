//
//  ViewController.m
//  DropShadows
//
//  Created by lzw on 15/9/22.
//  Copyright © 2015年 WeChat: lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *leftLayerView;

@property (weak, nonatomic) IBOutlet UIView *rightLayerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.leftLayerView.layer.shadowOpacity = 1;
    self.leftLayerView.layer.shadowOffset = CGSizeMake(3, 3);
    
    CALayer *layer = self.rightLayerView.layer;
    layer.shadowOffset = CGSizeMake(1, 3);
    layer.shadowColor = [UIColor redColor].CGColor;
    layer.shadowRadius = 10;
    layer.shadowOpacity = 0.5;
//    layer.shadowPath = [UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
