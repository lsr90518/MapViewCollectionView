//
//  ViewController.m
//  mapTest
//
//  Created by 劉 松然 on 2015/05/01.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import "ViewController.h"
#import "SSAnnotation.h"
#import "CollectionWrapView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CollectionWrapView *collectionWrapView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"地图标注";
    self.mapView = [[MKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 是否显示用户当前位置
    self.mapView.showsUserLocation = YES;
    // 设置代理
    self.mapView.delegate = self;
    
    // 地图显示类型
    /**
     *    MKMapTypeStandard  // 标准地图
     *    MKMapTypeHybrid    // 混合地图
     *    MKMapTypeSatellite // 卫星地图
     */
    self.mapView.mapType = MKMapTypeStandard;
    // 经纬度
    CLLocationCoordinate2D coord2D = {39.910650,116.47030};
    // 显示范围，数值越大，范围就越大
    MKCoordinateSpan span = {0.1,0.1};
    // 显示区域
    MKCoordinateRegion region = {coord2D,span};
    // 给地图设置显示区域
    [self.mapView setRegion:region animated:YES];
    // 是否允许缩放
    //self.mapView.zoomEnabled = NO;
    // 是否允许滚动
    //self.mapView.scrollEnabled = NO;
    
    // 初始化自定义Annotation(可以设置多个)
    SSAnnotation * annotation = [[SSAnnotation alloc] initWithCLLocation:coord2D];
    // 设置标题
    annotation.title = @"自定义标注位置";
    // 设置子标题
    annotation.subtitle = @"子标题";
    // 将标注添加到地图上（执行这步，就会执行下面的代理方法viewForAnnotation）
    [self.mapView addAnnotation:annotation];
    [self.view addSubview:_mapView];
    
    _collectionWrapView = [[CollectionWrapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.view addSubview:_collectionWrapView];
}

// 返回标注视图（大头针视图）
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    /**
     *  是不是有点像自定义UITableViewCell一样
     */
    static NSString * identifier = @"annotation";
    // 复用标注视图（MKpinAnnotationView是大头针视图，继承自MKAnnotation）
    MKAnnotationView * annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    // 判断是否为自定义的标注视图
    if ([annotation isKindOfClass:[SSAnnotation class]]) {
        // 设置大头针颜色
//        annotationView.pinColor = MKPinAnnotationColorGreen;
        // 点击大头针是否显示上面设置好的标题视图
        annotationView.canShowCallout = YES;
        // 要自定义描点图片，可以考虑使用MKAnnotationView;
        // MKPinAnnotationView只能是以大头针形式显示！
        annotationView.image = [UIImage imageNamed:@"new_likebtn_on"];
        // 添加标题视图右边视图
        UIButton * button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self action:@selector(didClickAnnotationViewRightButtonAction:) forControlEvents:UIControlEventTouchDragInside];
        annotationView.rightCalloutAccessoryView = button;
        // 是否以动画的形式显示标注（从天而降）
//        annotationView.animatesDrop = YES;
        annotationView.annotation = annotation;
        // 返回自定义的标注视图
        return annotationView;
        
    }else{
        // 当前设备位置的标注视图，返回nil，当前位置会创建一个默认的标注视图
        return nil;
    }
    
}
- (void)didClickAnnotationViewRightButtonAction:(UIButton *)button
{
    NSLog(@"%s",__FUNCTION__);
}
// 更新当前位置调用
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"%s",__FUNCTION__);
    
}
// 选中标注视图
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"%s",__FUNCTION__);
}
// 地图的现实区域改变调用
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
