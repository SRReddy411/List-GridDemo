//
//  GridCollectionCell.m
//  DemoOnGridOrListView
//
//  Created by volive solutions on 14/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import "GridCollectionCell.h"

@implementation GridCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _layOutView.layer.cornerRadius = 2;
    _layOutView.layer.shadowColor = [[UIColor lightGrayColor]CGColor];
    _layOutView.layer.shadowOpacity = 4;
    _layOutView.layer.shadowOffset = CGSizeMake(-1, 1);
    
   
}

@end
