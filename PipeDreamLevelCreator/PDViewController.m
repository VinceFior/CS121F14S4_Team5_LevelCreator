//
//  PDViewController.m
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import "PDViewController.h"
#import "PDGridModel.h"
#import "PDGridView.h"
#import "PDSelectorView.h"
#import "PDUtilities.h"

@interface PDViewController ()

@property PDGridModel *gridModel;

@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    const int numRows = 5;
    const int numCols = 5;
    const int defaultValue = 0;
    
    NSArray *initialGrid = [self gridWithRows:numRows cols:numCols value:defaultValue];
    
    self.gridModel = [[PDGridModel alloc] init];
    [self.gridModel initializeGridTo:initialGrid];
    [self.gridView setUpWithGrid:initialGrid];
    [self.gridView setTarget:self action:@selector(gridCellSelectedAtRow:col:)];
}

- (NSArray *)gridWithRows:(NSInteger)numRows cols:(NSInteger)numCols value:(NSInteger)value {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (int row = 0; row < numRows; row++) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] init];
        for (int col = 0; col < numCols; col++) {
            [rowArray addObject:[NSNumber numberWithInteger:value]];
        }
        [result addObject:rowArray];
    }
    return result;
}

- (void)gridCellSelectedAtRow:(NSNumber*)row col:(NSNumber*) col {
    int rowInt = [row intValue];
    int colInt = [col intValue];
    
    int currentValue = [self.selectorView getCurrentValue];
    
    [self.gridView setValueAtRow:rowInt column:colInt to:currentValue];
    [self.gridModel setValueAtRow:rowInt column:colInt to:currentValue];
}

// exportButtonPressed NSLogs a one-line string in this format:
//<width> <height> <startXCoord> <startYCoord> <goalXCoord> <goalYCoord> <NExW for each cell ...>
- (IBAction)exportButtonPressed {
    // Note: these four strings are totally dependent on PDUtilities. (This is bad, but meh.)
    NSString *startTxtString = @"computerHealthy";
    NSString *goalTxtString = @"goal";
    NSString *startOpeningsString = @"xExx";
    NSString *goalOpeningsString = @"NESW";
    
    NSInteger numRows = [self.gridModel numRows];
    NSInteger numCols = [self.gridModel numCols];
    
    NSMutableString *fileString = [[NSMutableString alloc] init];
    
    //"<width> <height> "
    [fileString appendString:[NSString stringWithFormat:@"%li %li ", numRows, numCols]];
    
    // find the start row/col and goal row/col
    NSInteger startRow = -1;
    NSInteger startCol = -1;
    NSInteger goalRow = -1;
    NSInteger goalCol = -1;
    for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
            NSInteger value = [self.gridModel getValueAtRow:row column:col];
            NSString *stringForValue = [PDUtilities txtForInt:value];
            if ([stringForValue isEqualToString:startTxtString]) {
                startRow = row;
                startCol = col;
            } else if ([stringForValue isEqualToString:goalTxtString]) {
                goalRow = row;
                goalCol = col;
            }
        }
    }
    //"<startXCoord> <startYCoord> <goalXCoord> <goalYCoord>"
    [fileString appendString:[NSString stringWithFormat:@"%li %li %li %li", startRow, startCol, goalRow, goalCol]];

    //" <NExW>" for each cell ...
    for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
            NSInteger value = [self.gridModel getValueAtRow:row column:col];
            NSString *stringForValue = [PDUtilities txtForInt:value];
            if ([stringForValue isEqualToString:startTxtString]) {
                stringForValue = startOpeningsString;
            } else if ([stringForValue isEqualToString:goalTxtString]) {
                stringForValue = goalOpeningsString;
            }
            [fileString appendString:[NSString stringWithFormat:@" %@", stringForValue]];
        }
    }
    
    // NSLog the resulting level
    NSLog(@"%@", fileString);
}

@end
