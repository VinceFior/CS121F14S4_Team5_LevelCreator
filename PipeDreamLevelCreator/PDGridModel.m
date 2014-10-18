//
//  PDGridModel.m
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import "PDGridModel.h"

@interface PDGridModel ()

@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation PDGridModel

- (void)initializeGridTo:(NSArray *)cells {
    NSInteger numRows = [cells count];
    NSInteger numCols = [cells[0] count];
    NSMutableArray *newCells = [[NSMutableArray alloc] init];
    for (int row = 0; row < numRows; row++) {
        NSArray *rowArray = [cells objectAtIndex:(int) row];
        NSMutableArray *newRowArray = [[NSMutableArray alloc] init];
        for (int col = 0; col < numCols; col++) {
            int cellValue = [(NSNumber *) [rowArray objectAtIndex:col] intValue];
            [newRowArray addObject:[NSNumber numberWithInt:cellValue]];
        }
        [newCells addObject:newRowArray];
    }
    self.cells = newCells;
}
- (NSInteger)numRows {
    return [self.cells count];
}
- (NSInteger)numCols {
    return [self.cells[0] count];
}

- (int)getValueAtRow:(int)row column:(int)column {
    return [(NSNumber*) self.cells[row][column] intValue];
}

- (void)setValueAtRow:(int)row column:(int)column to:(int)value {
    NSMutableArray *rowArray = self.cells[row];
    [rowArray setObject:[NSNumber numberWithInt:value] atIndexedSubscript:column];
}

@end
