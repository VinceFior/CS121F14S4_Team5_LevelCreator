//
//  PDSelectorView.h
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDSelectorView : UIView

- (void)resetCurrentValue;
- (int)getCurrentValue;
- (void)setTarget:(id)target action:(SEL)action;

@end
