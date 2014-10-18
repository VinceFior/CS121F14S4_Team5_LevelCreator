//
//  PDCellView.h
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDCellView : UIButton

@property NSInteger value;
@property NSInteger cellRow;
@property NSInteger cellCol;
@property (nonatomic, strong) UIImageView *customImageView;

- (void) setValueAndImageTo:(NSInteger)value;

@end
