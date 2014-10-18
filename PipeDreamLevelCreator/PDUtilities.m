//
//  PDUtilities.m
//  PipeDreamLevelCreator
//
//  Created by Vincent Fiorentini on 10/17/14.
//  Copyright (c) 2014 Flapjack Stack Hack. All rights reserved.
//

#import "PDUtilities.h"

@implementation PDUtilities

+ (UIImage *) imageForInt:(NSNumber *)value {
    NSDictionary *imageNamesForInts = @{@0 :  @"goal",
                                        @1 :  @"computerHealthy",
                                        @2 :  @"NESW",
                                        @3 :  @"NESx",
                                        @4 :  @"NExW",
                                        @5 :  @"NExx",
                                        @6 :  @"NxSW",
                                        @7 :  @"NxSx",
                                        @8 :  @"NxxW",
                                        @9 :  @"xESW",
                                        @10 : @"xESx",
                                        @11 : @"xExW",
                                        @12 : @"xxSW"
                                        };
    NSString *imageNameForInt = [imageNamesForInts objectForKey:value];
    if (imageNamesForInts) {
        return [UIImage imageNamed:imageNameForInt];
    } else {
        return nil;
    }
}

+ (NSString *) txtForInt:(NSInteger)value {
    NSDictionary *txtForInts = @{@0 :  @"goal",
                                        @1 :  @"computerHealthy",
                                        @2 :  @"NESW",
                                        @3 :  @"NESx",
                                        @4 :  @"NExW",
                                        @5 :  @"NExx",
                                        @6 :  @"NxSW",
                                        @7 :  @"NxSx",
                                        @8 :  @"NxxW",
                                        @9 :  @"xESW",
                                        @10 : @"xESx",
                                        @11 : @"xExW",
                                        @12 : @"xxSW"
                                        };
    return [txtForInts objectForKey:[NSNumber numberWithInteger:value]];
}

@end
