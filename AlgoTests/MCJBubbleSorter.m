//
//  MCJBubbleSorter.m
//  AlgoTests
//
//  Created by Mark Jones on 9/25/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "MCJBubbleSorter.h"

@implementation MCJBubbleSorter

- (NSArray *)sort:(NSArray *)unsortedArray
{
    BOOL swapped = NO;
    
    NSMutableArray *sortingArray = [unsortedArray mutableCopy];
    NSInteger count = unsortedArray.count;
    
    do {
        swapped = NO;
        for (int i = 0; i < (count - 1); i++)
        {
            if ([sortingArray[i+1] integerValue] < [sortingArray[i] integerValue])
            {
                NSNumber *tmp = sortingArray[i+1];
                sortingArray[i+1] = sortingArray[i];
                sortingArray[i] = tmp;
                swapped = YES;
            }
        }
    } while (swapped);
    
    return [sortingArray copy];
}

@end
