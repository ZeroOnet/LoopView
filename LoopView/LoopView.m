
//
//  LoopView.m
//  LoopView
//
//  Created by FunctionMaker on 16/9/25.
//  Copyright © 2016年 FunctionMaker. All rights reserved.
//

#import "LoopView.h"
#import "LoopImageViewCell.h"
#import "LoopImageViewLayout.h"

static NSString *const ID = @"IMAGECELL";

@interface LoopView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation LoopView {
    NSUInteger _imagesCount;
    NSArray *_imageArr;
    UICollectionView *_imageCollectionView;
    
}

- (instancetype)initWithImageArr:(NSArray<__kindof UIImage *> *)imageArr {
    
    self = [super init];
    if (self) {
        _imageArr = imageArr;
        _imagesCount = _imageArr.count + 2;
        
        [self initImageCollectionView];
    }
    
    return self;
    
}

- (void)initImageCollectionView {
    
    //set up frame here is invalid, and why?
    _imageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[LoopImageViewLayout alloc] init]];
    [_imageCollectionView registerClass:[LoopImageViewCell class] forCellWithReuseIdentifier:ID];
    _imageCollectionView.backgroundColor = [UIColor orangeColor];
    _imageCollectionView.bounces = YES;
    _imageCollectionView.pagingEnabled = YES;
    _imageCollectionView.showsHorizontalScrollIndicator = NO;
    
    _imageCollectionView.delegate = self;
    _imageCollectionView.dataSource = self;
    
    [self addSubview:_imageCollectionView];
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    _imageCollectionView.frame = self.bounds;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_imageCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    });
    
}

#pragma mark - UICollectionViewDataSourceMethod

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _imagesCount;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    //what's the reuse mechanism?
    LoopImageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.cellImage = _imageArr[_imageArr.count - 1];
    } else if (indexPath.row == _imagesCount - 1) {
        cell.cellImage = _imageArr[0];
    } else {
        cell.cellImage = _imageArr[indexPath.row - 1];
    }
    
    return cell;
    
}

#pragma mark - UIScrollViewDelegateMethod

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat offsetX = scrollView.contentOffset.x;
    NSUInteger currentPage = offsetX / scrollView.frame.size.width;
    
    if (currentPage == 0) {
        [scrollView scrollRectToVisible:CGRectMake(scrollView.frame.size.width * (_imagesCount - 2), 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
    } else if (currentPage == _imagesCount - 1) {
        [scrollView scrollRectToVisible:CGRectMake(scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:NO];
    }
    
}

@end

