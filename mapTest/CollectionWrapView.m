//
//  CollectionWrapView.m
//  mapTest
//
//  Created by 劉 松然 on 2015/05/25.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import "CollectionWrapView.h"

@implementation CollectionWrapView

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setBackgroundColor:[UIColor whiteColor]];
        _collectionView = [[CollectionView alloc]initWithFrame:frame];
        [self addSubview:_collectionView];
    }
    return self;
}

@end
