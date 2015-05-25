//
//  SSAnnotation.m
//  mapTest
//
//  Created by 劉 松然 on 2015/05/01.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import "SSAnnotation.h"

@implementation SSAnnotation

- (instancetype)initWithCLLocation:(CLLocationCoordinate2D)coordinate
{
    if (self = [super init]) {
        _coordinate = coordinate;
        
    }
    return self;
}


@end
