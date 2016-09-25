//
//  LoopImageViewCell.m
//  LoopView
//
//  Created by FunctionMaker on 16/9/25.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "LoopImageViewCell.h"

@implementation LoopImageViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        //some code
    }
    
    return self;
    
}

- (void)setCellImage:(UIImage *)cellImage {
    
    UIImageView *cellImageView = [[UIImageView alloc] initWithImage:cellImage];
    cellImageView.frame = self.contentView.frame;
    
    [self.contentView addSubview:cellImageView];
    
}


@end
