//
//  PDGridView.m
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import "PDGridView.h"
#import "PDCellView.h"
#import "PDUtilities.h"

@interface PDGridView () {
    NSMutableArray *_cells;
    id _target;
    SEL _action;
}
@end

@implementation PDGridView

- (void)setUpWithGrid:(NSArray *)grid {
    
    NSInteger numRows = [grid count];
    NSInteger numCols = [grid[0] count];
    
    UIColor *backgroundColor = [UIColor blackColor];
    UIColor *buttonColor = [UIColor lightGrayColor];
    float cellSeparatorPortion = 1 / 80.0;

    self.backgroundColor = backgroundColor;
    
    float frameWidth = CGRectGetWidth(self.frame);
    float frameHeight = CGRectGetHeight(self.frame);
    
    // Calculate the size of the spacing between cells and blocks
    CGFloat cellSeparatorWidth = frameWidth * cellSeparatorPortion;
    CGFloat cellSeparatorHeight = frameHeight * cellSeparatorPortion;
    
    // The total grid size = 9 buttons + 4 block separators + 10 cell separators
    // The button size is calculated by the equation above
    CGFloat buttonWidth = (frameWidth - (cellSeparatorWidth * (numRows + 1))) / (1.0 * numRows);
    CGFloat buttonHeight = (frameHeight - (cellSeparatorHeight * (numCols + 1))) / (1.0 * numCols);
    
    // Set up buttons (cells)
    _cells = [[NSMutableArray alloc] init];
    for (int row = 0; row < numRows; row++) {
        // Create an array of nine buttons that makes up a row
        NSMutableArray* rowArray = [[NSMutableArray alloc] init];
        for (int col = 0; col < numCols; col++) {
            // Calculate the number of separators to the left/top of the button
            int cellSepLeftNum = col + 1;
            int cellSepTopNum = row + 1;
            
            // Calculate the coordinate of the top left corner of the button
            CGFloat x = cellSepLeftNum * cellSeparatorWidth + col * buttonWidth;
            CGFloat y = cellSepTopNum * cellSeparatorHeight + row * buttonHeight;
            CGRect buttonFrame = CGRectMake(x, y, buttonWidth, buttonHeight);
            PDCellView* button = [[PDCellView alloc] initWithFrame:buttonFrame];
            button.backgroundColor = buttonColor;
            
            button.cellRow = row;
            button.cellCol = col;
            
            [button addTarget:self action:@selector(cellSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
            [rowArray addObject:button];
        }
        [_cells addObject:rowArray];
    }
    
    for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
            int value = [((NSNumber *) grid[row][col]) intValue];
            [self setValueAtRow:row column:col to:value];
        }
    }
    
}

- (void)setValueAtRow:(int)row column:(int)column to:(int)value {
    PDCellView *button = _cells[row][column];
    [button setValueAndImageTo:value];
}

- (void)cellSelected:(id)sender {
    PDCellView *cellView = (PDCellView *) sender;
    NSInteger row = cellView.cellRow;
    NSInteger column = cellView.cellCol;
    [_target performSelector:_action withObject:[NSNumber numberWithInteger:row] withObject:[NSNumber numberWithInteger:column]];
}

- (void)setTarget:(id)target action:(SEL)action {
    _target = target;
    _action = action;
}

@end
