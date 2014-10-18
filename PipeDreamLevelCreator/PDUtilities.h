//
//  PDUtilities.h
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PDUtilities : NSObject

+ (UIImage *) imageForInt:(NSNumber *)value;
+ (NSString *) txtForInt:(NSInteger)value;

@end
