//
//  NSString+Sorting.m
//  AlgoTests
//
//  Created by Mark Jones on 9/20/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "NSString+Sorting.h"

@implementation NSString (Sorting)

- (NSString *)sorted
{
    NSMutableArray *charsArray = [NSMutableArray arrayWithCapacity:self.length];
    for (int i = 0; i < self.length; i++)
    {
        charsArray[i] = [self substringWithRange:NSMakeRange(i, 1)];
    }
    
    [charsArray sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    return [charsArray componentsJoinedByString:@""];
}

@end
