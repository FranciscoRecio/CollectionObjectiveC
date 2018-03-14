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
@property NSInteger numPics;
@property NSMutableArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _numPics = 10;
    
    for (NSInteger i = 0; i < _numPics; i += 1) {
        [NetworkService getImage:i success:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_images addObject:image];
                NSLog(@"Added one");
                [self.collectionView reloadData];
            });
        } failure:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"Image error");
            });
        }];
    }
    //[self.collectionView reloadData];
}

#pragma CollectionViewDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"imageCell";
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(_images.count > indexPath.row) {
        cell.imageView.image = _images[indexPath.row];
    } else {
        cell.imageView.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _numPics;
}


@end
