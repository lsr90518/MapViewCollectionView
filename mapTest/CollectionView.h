//
//  CollectionView.h
//  mapTest
//
//  Created by 劉 松然 on 2015/05/25.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionView : UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;


@end
