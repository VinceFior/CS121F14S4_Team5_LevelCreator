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

- (IBAction)exportButtonPressed {
    NSInteger numRows = [self.gridModel numRows];
    NSInteger numCols = [self.gridModel numCols];
    
    NSMutableString *fileString = [[NSMutableString alloc] init];
    
    
    [fileString appendString:[NSString stringWithFormat:@"\nRows: %li\n", numRows]];
    [fileString appendString:[NSString stringWithFormat:@"Cols: %li\n", numCols]];
    for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
            NSInteger value = [self.gridModel getValueAtRow:row column:col];
            NSString *stringForValue = [PDUtilities txtForInt:value];
            [fileString appendString:[NSString stringWithFormat:@"%@", stringForValue]];
        }
        [fileString appendString:@"\n"];
    }
    
    NSLog(@"%@", fileString);
}

@end
