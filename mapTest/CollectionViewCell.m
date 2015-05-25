//
//  CollectionViewCell.m
//  mapTest
//
//  Created by 劉 松然 on 2015/05/25.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell{
    UIButton *imageView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = [UIColor colorWithWhite:0.97f alpha:1.0f];
        
        imageView = [[UIButton alloc]initWithFrame:CGRectMake(self.contentView.frame.origin.x + 10, self.contentView.frame.origin.y + 10, self.contentView.frame.size.width - 20, self.contentView.frame.size.height - 20)];
        [self setBackgroundColor:[UIColor clearColor]];
        [imageView addTarget:self action:@selector(buttonPushed) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:imageView];
    }
    return self;
}

-(void) setImage:(NSString *)imageName{
    [imageView setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

-(void) buttonPushed{
    NSLog(@"push");
}

@end
