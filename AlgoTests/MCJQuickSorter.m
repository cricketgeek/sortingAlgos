//
//  MCJQuickSorter.m
//  AlgoTests
//
//  Created by Mark Jones on 9/24/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "MCJQuickSorter.h"

@implementation MCJQuickSorter

- (NSArray *)sort:(NSArray *)unsortedArray
{
    NSMutableArray *sortingArray = [unsortedArray mutableCopy];
    NSInteger count = sortingArray.count;
    
    [self quickSort:sortingArray low:0 high:(count-1)];
    
    return [sortingArray copy];
}

- (void)quickSort:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{
    if (low < high)
    {
        NSInteger mid = [self partition:array low:low high:high];
        [self quickSort:array low:low high:mid];
        [self quickSort:array low:(mid + 1) high:high];
    }
}

- (NSInteger)partition:(NSMutableArray *)array low:(NSInteger)low high:(NSInteger)high
{
    NSNumber *pivot = array[low];
    --low;
    ++high;
    
    while (low < high)
    {
        do {
            --high;
        } while ([array[high] integerValue] > [pivot integerValue]);
        do {
            ++low;
        } while ([array[low] integerValue] < [pivot integerValue]);
        
        if (low < high)
        {
            NSNumber *tmp = array[low];
            array[low] = array[high];
            array[high] = tmp;
            NSLog(@"swapped %@ with %@",array[high],array[low]);
        }
    }
    
    return high;
}

@end
