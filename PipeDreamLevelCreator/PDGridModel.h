//
//  PDGridModel.h
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDGridModel : NSObject

- (void)initializeGridTo:(NSArray *)cells;
- (NSInteger)numRows;
- (NSInteger)numCols;
- (int)getValueAtRow:(int)row column:(int)column;
- (void)setValueAtRow:(int)row column:(int)column to:(int)value;

@end
