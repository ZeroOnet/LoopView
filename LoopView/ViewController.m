//
//  ViewController.m
//  LoopView
//
//  Created by FunctionMaker on 16/9/25.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "ViewController.h"
#import "LoopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    //imageArr is able to be initial by other object even if it includes objects are declared the type of UIImage.What a pity!
    
    //#warning imageArr should only include UIImage object
    
    NSArray *_imageArr = @[[UIImage imageNamed:@"image0"],
                           [UIImage imageNamed:@"image1"],
                           [UIImage imageNamed:@"image2"],
                           [UIImage imageNamed:@"image3"],
                           [UIImage imageNamed:@"image4"]];
    LoopView *loopView = [[LoopView alloc] initWithImageArr:_imageArr];
    loopView.frame = CGRectMake(0, 20, self.view.frame.size.width, 200);
    loopView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:loopView];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end
