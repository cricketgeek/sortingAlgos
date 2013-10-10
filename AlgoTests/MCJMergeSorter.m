//
//  MCJMergeSorter.m
//  AlgoTests
//
//  Created by Mark Jones on 9/25/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "MCJMergeSorter.h"

@implementation MCJMergeSorter


- (void)merge:(NSMutableArray *)unmergedArray low:(NSInteger)low mid:(NSInteger)mid high:(NSInteger)high
{
    NSInteger i = low;
    NSInteger j = mid + 1;
    NSInteger k = low;
    
    NSMutableArray *sortingArray = [NSMutableArray arrayWithCapacity:high];
    for (int i = 0; i < high; i++)
    {
        [sortingArray addObject:@0];
    }
    
    while ((i <= mid) || (j <= high))
    {
        if (i > mid) //pass the bottom half but j still less than high
        {
            sortingArray[k++] = unmergedArray[j++];
        }
        else if (j > high) //passed the the top half, still i less than midpoint
        {
            sortingArray[k++] = unmergedArray[i++];
        }
        else if ([unmergedArray[i] integerValue] < [unmergedArray[j] integerValue])
        {
            sortingArray[k++] = unmergedArray[i++];
        }
        else
        {
            sortingArray[k++] = unmergedArray[j++];
        }
    }
    
    //copy sorted array into working array
    for (int j = low; j <= high; j++)
    {
        unmergedArray[j] = sortingArray[j];
    }
}

- (void)mergeSort:(NSMutableArray *)sortingArray low:(NSInteger)low high:(NSInteger)high
{
    if (low < high)
    {
        NSInteger mid = (low + high)/2;
        [self mergeSort:sortingArray low:low high:mid];
        [self mergeSort:sortingArray low:(mid + 1) high:high];
        [self merge:sortingArray low:low mid:mid high:high];
    }
}

- (NSArray *)sort:(NSArray *)unsortedArray
{
    NSMutableArray *sortingArray = [unsortedArray mutableCopy];
    [self mergeSort:sortingArray low:0 high:(unsortedArray.count - 1)];
    return [sortingArray copy];
}

@end
