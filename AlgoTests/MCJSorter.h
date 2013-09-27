//
//  MCJSorter.h
//  AlgoTests
//
//  Created by Mark Jones on 9/24/13.
//  Copyright (c) 2013 Mark Jones. All rights reserved.
//

@interface MCJSorter : NSObject

- (NSArray *)sort:(NSArray *)unsortedArray;

+ (MCJSorter *)createSorter;

@end
