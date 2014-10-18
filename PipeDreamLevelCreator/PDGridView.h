//
//  PDGridView.h
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDGridView : UIView

- (void)setUpWithGrid:(NSArray *)grid;
- (void)setValueAtRow:(int)row column:(int)column to:(int)value;
- (void)setTarget:(id)target action:(SEL)action;

@end
