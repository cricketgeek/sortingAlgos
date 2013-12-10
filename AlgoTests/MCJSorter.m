//
//  MCJSorter.m
//  AlgoTests
//
//  Created by Mark Jones on 9/24/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "MCJSorter.h"

#import "MCJSelectionSorter.h"
#import "MCJQuickSorter.h"
#import "MCJBubbleSorter.h"
#import "MCJMergeSorter.h"

@implementation MCJSorter


- (NSArray *)sort:(NSArray *)unsortedArray
{
    return [NSMutableArray array];
}

+ (MCJSorter *)createSorter
{
    return [[MCJSelectionSorter alloc] init];
}


@end
