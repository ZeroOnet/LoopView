//
//  LoopImageViewLayout.m
//  LoopView
//
//  Created by FunctionMaker on 16/9/25.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "LoopImageViewLayout.h"

@implementation LoopImageViewLayout

- (void)prepareLayout {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 0.0f;
    self.minimumInteritemSpacing = 0.0f;
    
}

- (CGSize)itemSize {
    
    return self.collectionView.frame.size;
    
}

@end
