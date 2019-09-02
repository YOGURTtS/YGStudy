//
//  YGMessageForwardViewController.m
//  YGStudy
//
//  Created by 孙星 on 2019/9/2.
//  Copyright © 2019 YOGURTS. All rights reserved.
//

#import "YGMessageForwardViewController.h"
#import "YGMessageForwardObject.h"

@interface YGMessageForwardViewController ()

@end

@implementation YGMessageForwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"方法转发";
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YGMessageForwardObject *obj = [YGMessageForwardObject new];
    [obj haha];
}


@end
