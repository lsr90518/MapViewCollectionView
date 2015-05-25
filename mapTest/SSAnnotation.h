//
//  SSAnnotation.h
//  mapTest
//
//  Created by 劉 松然 on 2015/05/01.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SSAnnotation : UIViewController<MKAnnotation>

@property(nonatomic,readonly)CLLocationCoordinate2D coordinate; // 坐标
@property(nonatomic,copy)NSString * title; // 位置名称
@property(nonatomic,copy)NSString * subtitle; // 位置子信息（可选）
- (instancetype)initWithCLLocation:(CLLocationCoordinate2D) coordinate;

@end
