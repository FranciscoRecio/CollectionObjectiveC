//
//  ViewController.m
//  FranciscoRedditObjC
//
//  Created by Admin on 3/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "ViewController.h"
#import "ImageCell.h"
#import "NetworkService.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.collectionView reloadData];
}

#pragma CollectionViewDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"imageCell";
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [NetworkService getImage:indexPath.row success:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = image;
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.backgroundColor = [UIColor blueColor];
        });
    }];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


@end
