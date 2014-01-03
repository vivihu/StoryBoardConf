//
//  ViewController.m
//  StroyBoardTest
//
//  Created by icreative-mini on 14-1-3.
//  Copyright (c) 2014年 icreative-mini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
typedef void (^Arr_Block)(NSArray *array);

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    int (^myBlock)( int ) = ^( int num)
//    {
//        return num * 10;
//    };
    // block的声明^(参数类型 参数){代码块}

//    BOOL (^myBlock)( int , int) = ^(int a, int b)
//    {
//        if (a == 1)
//            return YES;
//        else
//            return NO;
//    };
//    
//    if (myBlock(1, 2)) {
//        NSLog(@"是1");
//    }else
//        NSLog(@"不是1");

    self.myBlock = ^(NSString *a) {
        return a;
    };
    
    NSArray *array = @[ @"h",@"e",@"l",@"l",@"o" ];
    for (NSString *a in array) {
        NSLog(@"%@",self.myBlock(a));
    }
    [self showArrayUsingBlock:^(NSArray *array) {
        NSLog(@"%@", array[1]);
    }];
}

- (void)showArrayUsingBlock:(Arr_Block)block
{
    NSArray *array = @[@"Chelsea", @"MUFC", @"Real Madrid"];
    block(array);
    
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObject:
     ^{
        NSLog(@"my block");
    
     }
     ];
    void (^ myblockt)() = [arr objectAtIndex:0];
    myblockt();
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
