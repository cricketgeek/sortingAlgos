//
//  MJPerms.m
//  AlgoTests
//
//  Created by Mark Jones on 1/23/14.
//  Copyright (c) 2014 Mark Jones. All rights reserved.
//

#import "MJPerms.h"

@implementation MJPerms


- (NSString *)insertCharIn:(NSString *)word char:(NSString *)c index:(NSInteger)index
{
    NSString *start = [word substringToIndex:index];
    NSString *end = [word substringFromIndex:index];
    return [NSString stringWithFormat:@"%@%@%@",start,c,end];
}

- (NSMutableArray *)getPerms:(NSString *)str
{
    if (str == nil) {
        return nil;
    }
    
    NSMutableArray *permutations = [NSMutableArray array];
    
    //base
    if (str.length == 0) {
        [permutations addObject:@""];
        return permutations;
    }
    
    NSString *first = [str substringToIndex:1];
    NSString *remainder = [str substringFromIndex:1];
    
    NSMutableArray *words = [self getPerms:remainder];
    
    for (NSString *word in words) {
        for (int j = 0; j <= word.length; j++) {
            NSString *s = [self insertCharIn:word char:first index:j];
            [permutations addObject:s];
        }
    }
    
    return permutations;
}

@end
