//
//  PDSelectorView.m
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import "PDSelectorView.h"
#import "PDCellView.h"

@interface PDSelectorView () {
    NSMutableArray *_cells;
    int _currentValue;
    id _target;
    SEL _action;
}
@end

@implementation PDSelectorView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    const int numItems = 13;
    
    UIColor *backgroundColor = [UIColor lightGrayColor];
    float cellSeparatorPortion = 1 / 100.0;
    
    if (self) {
        self.backgroundColor = backgroundColor;
        float frameWidth = CGRectGetWidth(self.frame);
        float frameHeight = CGRectGetHeight(self.frame);
        
        CGFloat cellSeparatorWidth = frameWidth * cellSeparatorPortion;
        
        // There are numItems+1 vertical separators and 2 horizontal separators around the numItems buttons
        CGFloat buttonWidth = (frameWidth - (cellSeparatorWidth * (numItems + 1))) / numItems;
        CGFloat buttonHeight = frameHeight - (cellSeparatorWidth * 2);
        
        _cells = [[NSMutableArray alloc] init];
        for (int i = 0; i < numItems; i++) {
            int numSeparatorsToLeft = i + 1;
            CGFloat x = (cellSeparatorWidth * numSeparatorsToLeft) + (buttonWidth * i);
            CGFloat y = cellSeparatorWidth;
            CGRect buttonFrame = CGRectMake(x, y, buttonWidth, buttonHeight);
            PDCellView* button = [[PDCellView alloc] initWithFrame:buttonFrame];
            
            
            [button setBackgroundImage:[UIImage imageNamed:@"numpad-neutral"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"numpad-pressed"] forState:UIControlStateHighlighted];
            [button setBackgroundImage:[UIImage imageNamed:@"numpad-pressed"] forState:UIControlStateHighlighted | UIControlStateSelected];
            [button setBackgroundImage:[UIImage imageNamed:@"numpad-selected"] forState:UIControlStateSelected];
            [button setValueAndImageTo:i];
            [button addTarget:self action:@selector(cellSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            [_cells addObject:button];
        }
        [self resetCurrentValue];
    }
    return self;
}

- (void)resetCurrentValue {
    int defaultSelectedCellNumber = 0;
    [self selectCell:defaultSelectedCellNumber];
}

- (int)getCurrentValue {
    return _currentValue;
}

- (void)cellSelected:(id)sender {
    PDCellView *cellView = (PDCellView *) sender;
    NSInteger cellNumber = cellView.value;
    [self selectCell:cellNumber];
    
    [_target performSelector:_action];
}

- (void)selectCell:(int)cellNumber {
    PDCellView *buttonToUnselect = [_cells objectAtIndex:_currentValue];
    [buttonToUnselect setSelected:NO];
    
    _currentValue = cellNumber;
    PDCellView *buttonToSelect = [_cells objectAtIndex:cellNumber];
    [buttonToSelect setSelected:YES];
}

- (void)setTarget:(id)target action:(SEL)action {
    _target = target;
    _action = action;
}


@end
