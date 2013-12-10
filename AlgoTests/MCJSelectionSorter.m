//
//  MCJBubbleSorter.m
//  AlgoTests
//
//  O(n^2)
//
//  Created by Mark Jones on 9/24/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "MCJSelectionSorter.h"

@implementation MCJSelectionSorter

- (NSInteger)getSmallest:(NSArray *)unsortedArray fromIndex:(NSInteger)index
{
    NSInteger smallest = index;
    for (int i = index; i < unsortedArray.count ; i++)
    {
        if ([unsortedArray[i] integerValue] < [unsortedArray[smallest] integerValue])
        {
            smallest = i;
        }
    }
    return smallest;
}



- (NSArray *)sort:(NSArray *)unsortedArray
{
    NSMutableArray *sortingArray = [unsortedArray mutableCopy];
    NSInteger count = sortingArray.count;
    
    for (int i = 0; i < count; i++)
    {
        NSInteger smallestIndex = [self getSmallest:sortingArray fromIndex:i];
        if (smallestIndex != i)
        {
            NSNumber *tmp = sortingArray[smallestIndex];
            sortingArray[smallestIndex] = sortingArray[i];
            sortingArray[i] = tmp;            
        }
    }
    
    return [sortingArray copy];
}

@end
