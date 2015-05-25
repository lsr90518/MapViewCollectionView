//
//  CollectionViewCell.m
//  mapTest
//
//  Created by 劉 松然 on 2015/05/25.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell{
    UIImageView *imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = [UIColor colorWithWhite:0.97f alpha:1.0f];
        
        imageView = [[UIImageView alloc]initWithFrame:self.contentView.frame];
        [self.contentView addSubview:imageView];
    }
    return self;
}

-(void) setImage:(NSString *)imageName{
    [imageView setImage:[UIImage imageNamed:imageName]];
}

@end
