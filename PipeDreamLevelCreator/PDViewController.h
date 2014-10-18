//
//  PDViewController.h
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDGridView;
@class PDSelectorView;

@interface PDViewController : UIViewController

@property (nonatomic, weak) IBOutlet PDGridView *gridView;
@property (nonatomic, weak) IBOutlet PDSelectorView *selectorView;

- (IBAction)exportButtonPressed;

@end
