//
//  ViewController.h
//  DemoOnGridOrListView
//
//  Created by volive solutions on 14/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) IBOutlet UICollectionView *myCollectionView;

 
@property (strong, nonatomic) IBOutlet UIBarButtonItem *gridBtn;

@end

