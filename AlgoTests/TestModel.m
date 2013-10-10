//
//  TestModel.m
//  AlgoTests
//
//  Created by Mark Jones on 9/29/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel


-(BOOL)isEqual:(id)object
{
    NSLog(@"isEqual called");

    return [super isEqual:object];
}


- (NSDictionary *)toDictionary
{
    return @{@"name": self.name};
}

@end
