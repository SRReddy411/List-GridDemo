//
//  ViewController.m
//  DemoOnGridOrListView
//
//  Created by volive solutions on 14/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import "ViewController.h"
#import "ListCollectionCell.h"
#import "GridCollectionCell.h"


@interface ViewController (){
    BOOL toggle;
    NSArray *photos;
  
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  photos =  [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"banner3.jpg"],
                        [UIImage imageNamed:@"banner4.jpg"],
                        [UIImage imageNamed:@"shoppingbanner3.jpg"],
                        [UIImage imageNamed:@"banner5.png"],
                        nil] ;
   
     
 
    toggle = [[NSUserDefaults standardUserDefaults]boolForKey:@"getToggle"];
    if (toggle == true){
        [_gridBtn setImage:[UIImage imageNamed:@"gridview.png"]];
    }else{
        [_gridBtn setImage:[UIImage imageNamed:@"viewlist.png"]];
    }
    
    
    UINib *nib1 = [UINib nibWithNibName:@"ListCollectionCell" bundle:nil];
    UINib *nib2 = [UINib nibWithNibName:@"GridCollectionCell" bundle:nil];
    
    [self.myCollectionView registerNib:nib1 forCellWithReuseIdentifier:@"LTC"];
     [self.myCollectionView registerNib:nib2 forCellWithReuseIdentifier:@"GTC"];
    
   
}

- (IBAction)gridBtnAction:(id)sender {
    
    
  
    if (toggle == NO){
        [_gridBtn setImage:[UIImage imageNamed:@"gridview.png"]];
        toggle = YES;
    }else{
        [_gridBtn setImage:[UIImage imageNamed:@"viewlist.png"]];
        toggle = NO;
    }
    [[NSUserDefaults standardUserDefaults]setBool:toggle forKey:@"getToggle"];
    [_myCollectionView reloadData];
    
}

#pragma COLLECTION delgate and datasource methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return photos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
      NSString *identifier = @"LTC";
    if (toggle == YES){
        identifier = @"GTC";
        GridCollectionCell *cell = [_myCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        
        cell.shopImage.image = photos[indexPath.row];
        return cell;
        
    }else{
        ListCollectionCell *cell = [_myCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        cell.shopImage.image = photos[indexPath.row];
        return cell;
    }
    
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (toggle == NO){
        //Replace the divisor with the column count requirement. Make sure to have it in float.
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width-20;
        float cellWidth = screenWidth / 2;
        CGSize size1 = CGSizeMake(cellWidth, cellWidth);
        
        return size1;
    }
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth ;
    CGSize size = CGSizeMake(cellWidth, 150);
    
    return size;
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
    
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
