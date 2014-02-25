//
//  ViewController.m
//  CocoaPodsDemo
//
//  Created by zzl on 14-2-20.
//  Copyright (c) 2014年 zzl. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    static char overviewKey;
    NSArray * array =[[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", nil];
    //为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
    NSString * overview = [[NSString alloc] initWithFormat:@"%@",@"First three numbers"];
    objc_setAssociatedObject(array, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
    NSLog(@"");
    
    NSString * associatedObject = (NSString *)objc_getAssociatedObject(array, &overviewKey);
    NSLog(associatedObject);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
