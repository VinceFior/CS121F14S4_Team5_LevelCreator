//
//  PDCellView.m
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import "PDCellView.h"
#import "PDUtilities.h"

@implementation PDCellView

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        
        float frameWidth = CGRectGetWidth(self.frame);
        float frameHeight = CGRectGetHeight(self.frame);
        CGRect imageFrame = CGRectMake(0, 0, frameWidth, frameHeight);
        self.customImageView = [[UIImageView alloc] initWithFrame:imageFrame];
        [self addSubview:self.customImageView];
    }
    
    return self;
}

-(void)setValueAndImageTo:(NSInteger)value {
    self.value = value;
    NSString* title = [NSString stringWithFormat:@"%ld", (long)value];
    [self setTitle:title forState:UIControlStateNormal];
    [self.customImageView setImage:[PDUtilities imageForInt:[NSNumber numberWithInteger:value]]];
}

@end
