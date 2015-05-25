//
//  CollectionView.m
//  mapTest
//
//  Created by 劉 松然 on 2015/05/25.
//  Copyright (c) 2015年 lsr. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionViewCell.h"

@implementation CollectionView{
    NSMutableArray *datas;
    UICollectionViewFlowLayout *vFlowLayout;
}


-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //
        datas = [[NSMutableArray alloc]initWithObjects:@"1.jpeg",@"2.jpeg",@"3.jpeg",@"4.jpeg",@"5.jpeg", nil];
        
        
        vFlowLayout = [[UICollectionViewFlowLayout alloc] init];
        vFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        vFlowLayout.itemSize = CGSizeMake(frame.size.width, 300);
        vFlowLayout.minimumInteritemSpacing = 0;
        vFlowLayout.minimumLineSpacing = 0;
        vFlowLayout.headerReferenceSize = CGSizeMake(0.0f, 30.0f);
        vFlowLayout.footerReferenceSize = CGSizeMake(0.0f, 30.0f);
        vFlowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:vFlowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView setPagingEnabled:YES];
        [_collectionView setShowsHorizontalScrollIndicator:NO];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        
        [self.collectionView setCollectionViewLayout:vFlowLayout animated:YES];
        
        [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewCell"];
        [self addSubview:self.collectionView];
    }
    return self;
}


#pragma mark - UICollectionViewDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return datas.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell"
                                                                                  forIndexPath:indexPath];
    [cell setImage:[datas objectAtIndex:indexPath.section]];
    return cell;
}

@end
