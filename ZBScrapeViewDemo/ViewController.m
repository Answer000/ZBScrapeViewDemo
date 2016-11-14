//
//  ViewController.m
//  ZBScrapeViewDemo
//
//  Created by 澳蜗科技 on 2016/11/14.
//  Copyright © 2016年 AnswerXu. All rights reserved.
//

#import "ViewController.h"
#import "ZBScrapeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    //代码创建
    //    ZBScrapeView *view0 = [[ZBScrapeView alloc] initWithFrame:self.view.bounds ];
    //    view0.topImage = [UIImage imageNamed:@"2A"];
    //    view0.bottomImage = [UIImage imageNamed:@"2B"];
    //    [self.view addSubview:view0];
    
    //xib创建
    ZBScrapeView *view = (ZBScrapeView *)self.view;
    view.topImage = [UIImage imageNamed:@"2A.jpg"];
    view.bottomImage = [UIImage imageNamed:@"2B.jpg"];
}

@end
